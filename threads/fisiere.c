#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

pthread_mutex_t m[10];
int frecv[10];

void* functie(void* param) {
	char* numeFisier = (char*)param;

	FILE *fin = fopen(numeFisier, "r");

	char chr;
	while (fscanf(fin, "%c", &chr) != EOF) {
	      int nr = chr - '0';
	      if (nr > 0) {
	      printf("Cifra este %d si litera e %c\n", nr, chr);
	      pthread_mutex_lock(&m[nr]);
	      frecv[nr]++;
	      pthread_mutex_unlock(&m[nr]);
	     }
	}

	fclose(fin);

	return 0;
}

int main(int argc, char** argv) {

	pthread_t *p = malloc((argc - 1) * sizeof(pthread_t));
	
	for (int i = 0; i < 10; i++)
	    pthread_mutex_init(&m[i], 0);


	for (int i = 1; i < argc; i++) {
	    pthread_create(&p[i - 1], NULL, functie, (void*)argv[i]);
	}

	for (int i = 0; i < argc - 1; i++)
	    pthread_join(p[i], NULL);

	free(p);
	for (int i = 0; i < 10; i++)
		printf("Frecventa lui %d este %d\n", i, frecv[i]);

	
	return 0;
}
