#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libgen.h>
#include <sys/syslimits.h>
#include <sys/stat.h>
/*
 * On Mac OSX, we can't create hard links on directories using the ln command..
 *
 * Install:
 *  make
 *  [sudo] make install
*/
char* get_real_destination(char* src, char* dst) {
    //If dst is a directory /foo and src is /a/b/c
    //the actual destination will become /foo/c
    char* final_dst = malloc(PATH_MAX);
    strcpy(final_dst, dst);
    struct stat dst_stat;
    if(stat(dst, &dst_stat) == 0)
    {
    	if(S_ISDIR(dst_stat.st_mode))
    	{
    	    char* src_file = basename(src);
    	    final_dst[strlen(dst)] = '/';
    	    strcpy(final_dst+strlen(dst)+1, src_file);
        }
    }
    return final_dst;
}

int main(int argc, char* argv[]) {
    //Make sure we have the right arguments
    if (argc == 1 || argc > 3)
    {
        fprintf(stderr,"Usage:\t%s source [destination]\n", argv[0]);
        fprintf(stderr,"\t  hard links the source directory to the destination\n");
        fprintf(stderr,"\t%s -u destination\n", argv[0]);
        fprintf(stderr,"\t  unlinks the destination directory\n");
        return 1;
    }
    int ret = 0;
    if(argc == 3 && strcmp(argv[1], "-u") == 0)
    {
        ret = unlink(argv[2]);
    }
    else if(argc == 2)
    {
        //No destination specified, use current directory
        char cwd[PATH_MAX];
        char* dst = get_real_destination(argv[1], getcwd(cwd, PATH_MAX));
        ret = link(argv[1], dst);
    }
    else
    {
        char* dst = get_real_destination(argv[1], argv[2]);
        ret = link(argv[1], dst);
    }

    if(ret != 0)
        perror(argv[0]);
    return ret;
}
