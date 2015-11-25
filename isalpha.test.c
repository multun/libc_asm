#include <stdio.h>
#include <ctype.h>

int ft_isalpha(char);

int main()
{
  int	i;
  for (i = 0;i<256;i++)
    {
      if (!ft_isalpha((char)i) == isalpha((char)i))
	  return -1;
    }
  return 0;
}
