#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
   int f;
   f = open("/tmp/fifo2", O_RDONLY);

   int nr = 0;

   read(f, &nr, sizeof(int));

   close(f);

   printf("The number of letters is %d\n", nr);

   return 0;
}
