// arr1_ptr.cc: vector sum of two 5-element arrays, demonstrating 
//              access of arrays using pointers                 

#include <iostream>
using namespace std;

int main()
{
  int i, x[5], y[5], sum[5];
  int *ptr_x,*ptr_y,*ptr_s;

  cout << "Please enter 5 integers for first array:";

  ptr_x=x;
  for (i=0;i<5;i++) {
    cin >> *ptr_x;
    ptr_x++;
  }

  ptr_y=y;
  cout << "Please enter 5 integers for second array:";
  for (i=0;i<5;i++) {
    cin >> *ptr_y;
    ptr_y++;
  }

  ptr_x=x;
  ptr_y=y;
  ptr_s=sum;
  for (i=0;i<5;i++) {
    *ptr_s = *ptr_x + *ptr_y;
    ptr_x++;
    ptr_y++;
    ptr_s++;
  }

  ptr_s=sum;
  for (i=0;i<5;i++) {
    cout << i << " " << *ptr_s << "\n";
    ptr_s++;
  }
}

  
