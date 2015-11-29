
#include <stdio.h>

unsigned int iterative_ackermann(unsigned int m, unsigned int n) {
  while (m != 0) {
    if (n == 0) {
      n = 1;
    } else {
      n = iterative_ackermann(m, n - 1);
    }
    m--;
  }
  return n + 1;
}

int main()
{
  printf("%p\n", iterative_ackermann);
  printf("%d\n", iterative_ackermann(4,1));
  return 0;
}
