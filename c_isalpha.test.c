#include <stdio.h>
#include <ctype.h>

int c_isalpha(char);

int main()
{
  int	i;
  for (i = 0;i<256;i++)
    {
      if (!c_isalpha((char)i) == isalpha((char)i))
	  return -1;
    }
  return 0;
}
