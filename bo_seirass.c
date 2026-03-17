#include <stdio.h>
#include <string.h> 
#include <stdlib.h>
#include <unistd.h>



/* function that spawns a cell that we need invoke */
void pshell(void){
    execl("/bin/sh", "sh", NULL);
}

void print(char* message){
    char buffer[64];
    strcpy(buffer, message);
    printf("%s\n",buffer);
}

int main(int argc, char ** argv){
    if (argc != 2){
        printf("Usage: %s <name>\n", argv[0]);
        return 1;
    }
    print(argv[1]);

    return 0;
}

