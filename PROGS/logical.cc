/* logical.cc: demonstrates bitwise logical operations in C/C++ */

#include <iostream>
using namespace std;

int main()
{
  int x = 0x456789ab,
      y = 0x9abcdef0,
      z;

  int w1 = 0xaaaaaaaa;
  unsigned int w2 = 0xaaaaaaaa;

  cout << "x = " << hex << x << " y = " << hex << y << endl;
  z = ~x;
  cout << "~x = " << hex << z << endl;
  z = x & y;
  cout << "x & y = " << hex << z << endl;

  z = x | y;
  cout << "x | y = " << hex << z << endl;

  z = x ^ y;
  cout << "x ^ y = " << hex << z << endl;

  cout << "\nw1 = " << hex << w1 << " w2 = " << w2 << endl;
  z = w1 << 3;
  cout << "w1 << 3 = " << hex << z << endl;

  z = w1 >> 3;
  cout << "w1 >> 3 = " << hex << z << endl;
  z = w2 >> 3;
  cout << "w2 >> 3 = " << hex << z << endl;

}
