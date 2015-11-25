#include <stdio.h>
#include <ctype.h>

#include "logstrings.h"

int ft_isalpha(char);
const char fctname[] = "isalpha";

int main()
{
  int	i;
  printf(LOG_FORMAT_STRING,fctname);
  for (i = 0;i<256;i++)
    {
      if (!ft_isalpha((char)i) == isalpha((char)i))
	{
	  puts(LOG_FAIL);
	  printf("error at %d !\n",i);
	  return 0;
	}
      
    }
  puts(LOG_SUCCESS);
  return 0;
}
