#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t m;
int sumadiv4;

void* functie(void* args) {
      char* filename = (char*)args;
      FILE *fin = fopen(filename, "r");

      char chr;

      while (fscanf(fin, "%c", &chr) != EOF) {
	     int nr = chr - '0';

	     if (nr > 0) {
		     if (nr % 4 == 0) {
			    pthread_mutex_lock(&m);
			    sumadiv4 += nr;
			    pthread_mutex_unlock(&m);
		     }
			
		     int fact = 1;
		     for (int i = 2; i <= nr; i++)
			     fact *= i;

		     printf("Fcatoricalul este %d\n", fact);
	     }
      }

      fclose(fin);

      return 0;
}

int main(int argc, char** argv) {
	pthread_t* p = malloc(sizeof(pthread_t) * (argc - 1));
	
	pthread_mutex_init(&m, 0);
	

	for (int i = 0; i < argc - 1; i++) {
		pthread_create(&p[i], NULL, functie, (void*)argv[i + 1]);
	}

	for (int i = 0; i < argc - 1; i++)
		pthread_join(p[i], NULL);

	free(p);

	printf("NUmerele divizibile cu 4 sunt %d\n", sumadiv4);

	return 0;
}
