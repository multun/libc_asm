#include <string.h>

char *c_strcat(char *dest, const char *src);

int main ()
{
  char str1[20] = "test";
  char str2[] = "test2";
  return strcmp("testtest2", strcat(str1,str2));;
}
