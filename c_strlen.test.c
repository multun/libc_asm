#include <string.h>
#include <stdio.h>

size_t c_strlen(const char *str);

int main()
{
  const char test1[] = "multun";
  const char test2[] = "";
  return !(strlen(test2)==c_strlen(test2) && strlen(test1)==c_strlen(test1));
}
