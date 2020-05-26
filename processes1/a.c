#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/wait.h>

int main() {
   int p[2];
   pipe(p);
   if (fork() == 0) {
	close(p[0]); //we do not read from pipe
	int n, nr;
	scanf("%d", &n);
        write(p[1], &n, sizeof(int));
	for (int i = 0; i < n; i++) {
	    scanf("%d", &nr);
	    write(p[1], &nr, sizeof(int));
	}
	close(p[1]);
	exit(0);
   }
   else {
      if (fork() == 0) {
         int n, nr, sum = 0;
	 close(p[1]);
	 read(p[0], &n, sizeof(int));
	 for (int i = 0; i < n; i++) {
	     read(p[0], &nr, sizeof(int));
	     sum += nr;
	 }
	 int f;
	 f = open("/tmp/fifo1", O_WRONLY);
	 write(f, &sum, sizeof(int));
	 close(f);
         exit(0);
      }
      else 
      {
	 close(p[0]);
	 close(p[1]);
	 wait(0);
	 wait(0);
      }
   }

   return 0;
}	
