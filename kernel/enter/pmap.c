/* See COPYRIGHT for copyright information. */

#include "x86.h"
#include "mmu.h"
#include "error.h"
#include "string.h"
#include "assert.h"
#include "pmap.h"
#include "video.h"
#include "kclock.h"
#include "memlayout.h"

// These variables are set by i386_detect_memory()

//static size_t npages_basemem;	// Amount of base memory (in pages)

// These variables are set in mem_init()

pde_t *kern_pgdir;		// Kernel's initial page directory
struct Page pages[npages];		// Physical page state array
static struct Page *page_free_list;	// Free list of physical pages





// --------------------------------------------------------------
// Tracking of physical pages.
// The 'pages' array has one 'struct Page' entry per physical page.
// Pages are reference counted, and free pages are kept on a linked list.
// --------------------------------------------------------------

//
// Initialize page structure and memory free list.
// After this is done, NEVER use boot_alloc again.  ONLY use the page
// allocator functions below to allocate and deallocate physical
// memory via the page_free_list.
//
 __attribute__((__aligned__(PGSIZE)))
static pde_t kpgdir[NPDENTRIES];

__attribute__((__aligned__(PGSIZE)))
static pte_t kpgtable[npages];

void
page_init(void)
{
	// The example code here marks all physical pages as free.
	// However this is not truly the case.  What memory is free?
	//  1) Mark physical page 0 as in use.
	//     This way we preserve the real-mode IDT and BIOS structures
	//     in case we ever need them.  (Currently we don't, but...)
	//  2) The rest of base memory, [PGSIZE, npages_basemem * PGSIZE)
	//     is free.
	//  3) Then comes the IO hole [IOPHYSMEM, EXTPHYSMEM), which must
	//     never be allocated.
	//  4) Then extended memory [EXTPHYSMEM, ...).
	//     Some of it is in use, some is free. Where is the kernel
	//     in physical memory?  Which pages are already in use for
	//     page tables and other data structures?
	//
	// Change the code to reflect this.
	// NB: DO NOT actually touch the physical memory corresponding to
	// free pages!

	int pdx;
	pde_t *pgdir = kpgdir;
	pte_t *pgtable = kpgtable;
	for (pdx = 0; pdx < (npages / NPTENTRIES); pdx++) {
		pgdir[pdx + (KERNBASE >> PDXSHIFT)] = PADDR(pgtable) | PTE_P | PTE_W;
		pgtable += NPTENTRIES;
	}
	int pfaddr = PHYMEM - PGSIZE;
	pgtable--;
	for (; pfaddr >= 0; pfaddr -= PGSIZE) {
		*pgtable = pfaddr | PTE_P | PTE_U | PTE_W;
		pgtable --;
	}
	kern_pgdir = pgdir;
	lcr3(PADDR(kern_pgdir));	
	unsigned long i;
	int base = 0x400;
	for (i = 0; i < base; i++) {
		pages[i].pp_ref = 1;
	}
	for (i = npages-1; i >= base; i--) {
		pages[i].pp_ref = 0;
		pages[i].pp_link = page_free_list;
		page_free_list = &pages[i];
	}
	boot_map_region(kern_pgdir, KSTACKTOP-KSTKSIZE, KSTKSIZE, PADDR(bootstack), (PTE_W | PTE_P));
	boot_map_region(kern_pgdir, (uintptr_t)VMEM_ADDR, ROUNDUP(SCR_SIZE, PGSIZE), (physaddr_t)VMEM_ADDR, (PTE_W | PTE_P));
}

//
// Allocates a physical page.  If (alloc_flags & ALLOC_ZERO), fills the entire
// returned physical page with '\0' bytes.  Does NOT increment the reference
// count of the page - the caller must do these if necessary (either explicitly
// or via page_insert).
//
// Returns NULL if out of free memory.
//
// Hint: use page2kva and memset
struct Page *
page_alloc(int alloc_flags)
{
	struct Page *p = page_free_list;
	if (p == NULL) return NULL;
	if (alloc_flags & ALLOC_ZERO) {
		memset(page2kva(p), 0, PGSIZE);
	}
	page_free_list = page_free_list -> pp_link;
	p -> pp_link = NULL;
	return p;
}

//
// Return a page to the free list.
// (This function should only be called when pp->pp_ref reaches 0.)
//
void
page_free(struct Page *pp)
{
	assert(pp->pp_ref == 0 && pp->pp_link == NULL);
	pp->pp_link = page_free_list;
	page_free_list = pp;
}

//
// Decrement the reference count on a page,
// freeing it if there are no more refs.
//
void
page_decref(struct Page* pp)
{
	if (--pp->pp_ref == 0)
		page_free(pp);
}

// Given 'pgdir', a pointer to a page directory, pgdir_walk returns
// a pointer to the page table entry (PTE) for linear address 'va'.
// This requires walking the two-level page table structure.
//
// The relevant page table page might not exist yet.
// If this is true, and create == false, then pgdir_walk returns NULL.
// Otherwise, pgdir_walk allocates a new page table page with page_alloc.
//    - If the allocation fails, pgdir_walk returns NULL.
//    - Otherwise, the new page's reference count is incremented,
//	the page is cleared,
//	and pgdir_walk returns a pointer into the new page table page.
//
// Hint 1: you can turn a Page * into the physical address of the
// page it refers to with page2pa() from kern/pmap.h.
//
// Hint 2: the x86 MMU checks permission bits in both the page directory
// and the page table, so it's safe to leave permissions in the page
// more permissive than strictly necessary.
//
// Hint 3: look at inc/mmu.h for useful macros that mainipulate page
// table and page directory entries.
//
pte_t *
pgdir_walk(pde_t *pgdir, const void *va, int create)
{
	pte_t *pgtable;
	int pdx = PDX(va);
	if (pgdir[pdx] & PTE_P) {
		pgtable = KADDR(PTE_ADDR(pgdir[pdx]));
	}
	else {
		if (create == false) return NULL;
		struct Page *p = page_alloc(ALLOC_ZERO);
		if (p == NULL) return NULL;
		pgtable = page2kva(p);
		p -> pp_ref ++;
		pgdir[pdx] = PADDR(pgtable) | PTE_P | PTE_W | PTE_U;
	}
	int ptx = PTX(va);
	return &pgtable[ptx];

}

//
// Map [va, va+size) of virtual address space to physical [pa, pa+size)
// in the page table rooted at pgdir.  Size is a multiple of PGSIZE.
// Use permission bits perm|PTE_P for the entries.
//
// This function is only intended to set up the ``static'' mappings
// above UTOP. As such, it should *not* change the pp_ref field on the
// mapped pages.
//
// Hint: the TA solution uses pgdir_walk
void
boot_map_region(pde_t *pgdir, uintptr_t va, size_t size, physaddr_t pa, int perm)
{
	int i,n;
	n=size/PGSIZE;
	for (i = 0; i < n; i ++) {
		pte_t *pte = pgdir_walk(pgdir, (void*)va, true);
		if (pte == NULL) return;
		*pte = pa | perm | PTE_P;
		va += PGSIZE;
		pa += PGSIZE;
	}
}

//
// Map the physical page 'pp' at virtual address 'va'.
// The permissions (the low 12 bits) of the page table entry
// should be set to 'perm|PTE_P'.
//
// Requirements
//   - If there is already a page mapped at 'va', it should be page_remove()d.
//   - If necessary, on demand, a page table should be allocated and inserted
//     into 'pgdir'.
//   - pp->pp_ref should be incremented if the insertion succeeds.
//   - The TLB must be invalidated if a page was formerly present at 'va'.
//
// Corner-case hint: Make sure to consider what happens when the same
// pp is re-inserted at the same virtual address in the same pgdir.
// Don't be tempted to write special-case code to handle this
// situation, though; there's an elegant way to address it.
//
// RETURNS:
//   0 on success
//   -E_NO_MEM, if page table couldn't be allocated
//
// Hint: The TA solution is implemented using pgdir_walk, page_remove,
// and page2pa.
//
int
page_insert(pde_t *pgdir, struct Page *pp, void *va, int perm)
{
	pte_t *pte = pgdir_walk(pgdir, va, true);
	if (pte == NULL) {
		return -1;
	}
	physaddr_t pa = page2pa(pp);
	if (*pte & PTE_P) {
		if (PTE_ADDR(*pte) == pa) {
			*pte = pa | perm | PTE_P;
		}
		else {
			page_remove(pgdir, va);
		}
	}
	*pte = pa | perm | PTE_P;
	pp -> pp_ref ++;
	return 0;

}

//
// Return the page mapped at virtual address 'va'.
// If pte_store is not zero, then we store in it the address
// of the pte for this page.  This is used by page_remove and
// can be used to verify page permissions for syscall arguments,
// but should not be used by most callers.
//
// Return NULL if there is no page mapped at va.
//
// Hint: the TA solution uses pgdir_walk and pa2page.
//
struct Page *
page_lookup(pde_t *pgdir, void *va, pte_t **pte_store)
{
	pte_t *pte = pgdir_walk(pgdir, va, false);
	if (pte == NULL) return NULL;
	if (pte_store != NULL) *pte_store = pte;
	return pa2page(PTE_ADDR(*pte));
}

//
// Unmaps the physical page at virtual address 'va'.
// If there is no physical page at that address, silently does nothing.
//
// Details:
//   - The ref count on the physical page should decrement.
//   - The physical page should be freed if the refcount reaches 0.
//   - The pg table entry corresponding to 'va' should be set to 0.
//     (if such a PTE exists)
//   - The TLB must be invalidated if you remove an entry from
//     the page table.
//
// Hint: The TA solution is implemented using page_lookup,
// 	tlb_invalidate, and page_decref.
//
void
page_remove(pde_t *pgdir, void *va)
{
	pte_t *pte;
	pte_t **pte_store = &pte;
	struct Page *p = page_lookup(pgdir, va, pte_store);
	if (p != NULL) {
		**pte_store = 0;
		page_decref(p);
		tlb_invalidate(pgdir, va);
	}
}

//
// Invalidate a TLB entry, but only if the page tables being
// edited are the ones currently in use by the processor.
//
void
tlb_invalidate(pde_t *pgdir, void *va)
{
	// Flush the entry only if we're modifying the current address space.
	// For now, there is only one address space, so always invalidate.
	invlpg(va);
}


