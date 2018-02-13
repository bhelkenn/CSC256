#include <iostream>

using std::cin;
using std::cout;
using std::endl;

int ack(int, int);

int main()
{
  int m, n;
  
  cout << "Enter two integers: ";
  cin >> m >> n;
  cout << "Result = " << ack(m,n) << endl;
}

int ack(int arg0, int arg1)
{
  if (arg0 == 0) {
    return(arg1 + 1);
  }
  else if ((arg0 > 0) && (arg1 == 0)) {
    return(ack(arg0-1, 1));
  }
  else {
    return(ack(arg0-1, ack(arg0, arg1-1)));
  }
}
