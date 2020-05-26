#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

typedef struct { int ps; } str;

void* functie(void* params) {
	char* chr = (char*)params;
	int nr = atoi(chr);

	printf("NUmarul in thread e %d\n", nr);

	str *s = malloc(sizeof(str));

	s->ps = nr;

	pthread_exit(s);
}

int main(int argc, char** argv) {
	str *a, *b;

	pthread_t *p = malloc(sizeof(pthread_t) * 2);

	for (int i = 0; i < 2; i++)
		pthread_create(&p[i], NULL, functie, (void*)argv[i + 1]);

	pthread_join(p[0], (void*)&a);
	pthread_join(p[1], (void*)&b);

	printf("A este %d si b este %d\n", ((str*)a)->ps, ((str*)b)->ps);
	
	free(a);
	free(b);

	free(p);

	return 0;
}
