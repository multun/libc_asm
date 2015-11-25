#include <stdio.h>
#include <ctype.h>

#include <string.h>

int ft_bzero(void*,size_t);


int main()
{
  int	i;
  char	buffer[256];
  
  for (i = 0;i<256;i++)
    buffer[i] = 42;


  ft_bzero(buffer,256);
  
  for (i = 0;i<256;i++)
    {
      if (buffer[i])
	return -1;
    }
  return 0;
}
