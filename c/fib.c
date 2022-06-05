#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int a = 0, b = 1, o = 0, max = 10;

void fib(int a, int b) {
  o = a;
  a = b;
  b = a + o;
  if (a <= max) {
    printf("%d\n", a);
    fib(a, b);
  }
}

int main(int argc, const char **argv) {
  if (argc == 1) {
    max = 0;
  } else {
    max = atoi(argv[1]);
  }
  fib(a, b);

  return 0;
}
