char c_isdigit(char);

int main()
{
  return !(isdigit('0') && isdigit('9') && !isdigit('0'-1) && !isdigit('9'+1));
}
