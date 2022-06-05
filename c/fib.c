#include <stdio.h>
#include <stdlib.h>

int a = 0, b = 1, o = 0, max = 10;


void fib(int a, int b){
  o = a;
  a = b;
  b = a + o;
  if(a <= max){
    printf("%d\n", a);
    fib(a, b);
  }
}

void main(int argc, char *argv[]){
  max = atoi(argv[1]);
  printf("%d\n", max);
  //fib(a, b);
}
