#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

void* functia(void* numar) {
	char* nrchar = (char*)numar;
	 printf("Am primit %s\n", nrchar);
	int nr = atoi(nrchar);
	printf("Numarul este %d\n", nr);
	return 0;
}	

int main(int argc, char** argv) {
    pthread_t* p = malloc(sizeof(pthread_t) * (argc - 1));

    for (int i = 0; i < argc - 1; i++) {
	pthread_create(&p[i], NULL, functia, (void*)argv[i + 1]);
    }

    for (int i = 0; i < argc - 1; i++)
       pthread_join(p[i], NULL);
 
    free(p);

    return 0;
}
