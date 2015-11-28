#include <string.h>
#include <stdio.h>

void *c_memset(void *str, int c, size_t n);

int main()
{
  char teststring[] = "aaaaa aaaaa";
  char *ret = c_memset(teststring, 'b',5);
  return strcmp(teststring, "bbbbb aaaaa");
}
