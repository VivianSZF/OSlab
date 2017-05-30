#include "game.h"
#include "x86.h"
#include "timer.h"
#include "assert.h"
#include "types.h"
#include "cpu.h"
#include "sema.h"

extern void init_serial();
extern void init_timer();
extern void init_idt();
extern void init_intr();
extern int fork(void);
extern int getpid(void);
extern void exit(void);
extern void sleep(int sec); 
extern void thread(void *addr);
extern int sem_init(Sema *sema,int value);
extern int sem_destroy(Sema *sema);
extern int sem_wait(Sema *sema);
extern int sem_trywait(Sema *sema);
extern int sem_post(Sema *sema);


Sema empty,full,mutex;
int buf[10];

void producer()
{
	printf("I am the producer\n");
	int i;
	for(i=0;i<10;i++)
	{
		sem_wait(&empty);
		sem_wait(&mutex);
		printf("produce No.%d\n",i);
		buf[i]=i;
		sem_post(&mutex);
		sem_post(&full);	
	}	
	exit();
}

void consumer()
{
	printf("I am the consumer\n");
	int i;
	for(i=0;i<10;i++)
	{
		sem_wait(&full);
		sem_wait(&mutex);
		printf("consume No.%d\n",i);
		sem_post(&mutex);
		sem_post(&empty);
	}
	exit();
}


void
game_init(void) {

	printf("Welcome to our game~~~ready ~~~go~~~\n");
//	init_keyboard();
//	main_loop();//add the syscall fork,sleep,getpid,exit in it(written in game.c)
        //fork();
	//exit();
	//sleep(1);
	//printf("skskkssks");
	//while(1);
	
	//here is the producer and consumer test
	sem_init(&empty,5);
	//printf("dead here");
	sem_init(&full,0);
	sem_init(&mutex,1);
	
	thread(producer);	
	thread(consumer);

	//sem_destroy(&empty);
	//sem_destroy(&full);
	//sem_destroy(&mutex);
	while(1);
	exit();
	assert(0); /* main_loop是死循环，永远无法返回这�?*/
}
