#include <stdio.h>
#include <string.h>

int c_memcmp(const void *str1, const void *str2, size_t n);

int main ()
{
  const char t1a[] = "a";
  const char t1b[] = "b";

  const char t2a[] = "a";
  const char t2b[] = "a";

  const char t3a[] = "b";
  const char t3b[] = "a";
  
  return !(c_memcmp(t1a,t1b,1)<0 && c_memcmp(t2a,t2b,1)==0 && c_memcmp(t3a,t3b,1)>0);
}
