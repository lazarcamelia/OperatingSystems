#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main () {
     int f, sum;
     f = open("/tmp/fifo1", O_RDONLY);
     read(f, &sum, sizeof(int));

     printf("The sum is %d\n", sum);

     close(f);

     return 0;
}
