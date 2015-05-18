#include <stdio.h>
#include <string.h>

#define MATCH(s1,s2) (strcmp(s1,s2) == 0)

int main(){

  int base = 0;
  int i = 0;

  while(1) { //REPL

    printf(">");

    char line[1024] = {0};
    fgets(line, 1023, stdin);

    if( MATCH(line, "base\n") ){
      base++;
      continue;
    }
    if( MATCH(line, "clear\n") ){
      base = 0;
      continue;
    }

    if(MATCH(line, "exit\n")){
      break;
    }

    char command[128] = {0};

    sscanf(line, "%s %d", command, &i);

    if( MATCH(command, "twice") ){
      i *= 2;
      printf("result:%d\n", i + base);
    } else if( MATCH(command, "10times") ){
      i *= 10;
      printf("result:%d\n", i + base);
    } else {

      printf("unknown command\n");
    }


  } // end of REPL

  return 0;
}
