#include <unistd.h>
#include <stdio.h>
#include <string.h>
/*
 * On Mac OSX, we can't create hard links on directories using the ln command..
 *
 * Install:
 *  make
 *  [sudo] make install
*/
int main(int argc, char* argv[]) {
    //Make sure we have the right arguments
    if (argc != 3)
    {
        fprintf(stderr,"Usage:\t%s source destination\n", argv[0]);
        fprintf(stderr,"\t  hard links the source directory to the destination\n");
        fprintf(stderr,"\t%s -u destination\n", argv[0]);
        fprintf(stderr,"\t  unlinks the destination directory\n");
        return 1;
    }
    int ret = 0;
    if(strcmp(argv[1], "-u") == 0)
    {
        ret = unlink(argv[2]);
    }
    else
        ret = link(argv[1],argv[2]);
    
    if (ret != 0)
        perror(argv[0]);
    return ret;
}
