#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char** argv) {
     FILE *fin = fopen(argv[1], "r");

     int nr;

     while (fscanf(fin, "%d", &nr) != EOF) {
	 printf("%d\n", nr);
     }

     fclose(fin);

     return 0;
}
