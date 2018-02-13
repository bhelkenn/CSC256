/* poly.cc: C++ program to demonstrate nested function calls */

#include <iostream>

using std::cout;
using std::endl;

int poly(int arg);
int pow(int arg0, int arg1);

int main()
{
  int x = 3, y = 5, temp;

  temp = poly(x);
  cout << x << "^4 + " << x << "^3 + 1 = " << temp << endl;

  temp = poly(y);
  cout << y << "^4 + " << y << "^3 + 1 = " << temp << endl;

}

int poly(int arg)
{
  int temp1, res;

  temp1 = pow(arg,4);
  res = pow(arg,3);
  res = res + temp1 + 1;
  return(res);
}
int pow(int arg0, int arg1)
{
  int result,i;
  
  result = 1; 
  for (i=1; i<=arg1;i++)
    result = result*arg0;
  return(result);
}
