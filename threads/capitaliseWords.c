#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>

void* functie(void* sir) {
     char string_trimis[100];
     strcpy(string_trimis, (char*)sir);
     if (string_trimis[0] >= 'a' && string_trimis[0] <= 'z')
	     string_trimis[0] -= 32;

     printf("%s\n", string_trimis);
     return 0;
}

int main(int argc, char** argv) {

     pthread_t *p = malloc((argc - 1) * sizeof(pthread_t));

     for (int i = 0; i < argc - 1; i++) {
	  pthread_create(&p[i], NULL, functie, (void**)argv[i + 1]);
     }

     for (int i = 0; i < argc - 1; i++)
	  pthread_join(p[i], NULL);

     return 0;
}
