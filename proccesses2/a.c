#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
    int p[2];
    pipe(p);

    if (fork() == 0) {
	close(p[0]);
	char sir[100];
	//scanf("%s", sir);
	fgets(sir, sizeof(sir), stdin);
	int nr_chars = strlen(sir);
        write(p[1], &nr_chars, sizeof(int));
	write(p[1], &sir, sizeof(char) * nr_chars);
        close(p[1]);
	exit(0);
    }
    else if (fork() == 0) {
	int nr_chars;
	char sir[100];
	close(p[1]);
	read(p[0], &nr_chars, sizeof(int));
	read(p[0], &sir, sizeof(char) * nr_chars);
	close(p[0]);

	int nr_litere = 0;

	for (int i = 0; i < nr_chars; i++) {
	    if (sir[i] >= 'A' && sir[i] <= 'Z')
		  nr_litere++;
	    else if (sir[i] >= 'a' && sir[i] <= 'z')
		  nr_litere++;
	}
	int f;
	f = open("/tmp/fifo2", O_WRONLY);
	write(f, &nr_litere, sizeof(int));
	close(f);
	exit(0);
    }
    else {
	close(p[0]);
	close(p[1]);
	wait(0);
	wait(0);
   }
   return 0;
}
