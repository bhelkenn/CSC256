/* arr1.cc: vector sum of two 5-element arrays */

#include <iostream>
using namespace std;

int main()
{
  int i, x[5], y[5], sum[5];

  cout << "Please enter 5 integers for first array:";
  for (i=0;i<5;i++)
    cin >> x[i];

  cout << "Please enter 5 integers for second array:";
  for (i=0;i<5;i++)
    cin >> y[i];

  for (i=0;i<5;i++)
    sum[i]=x[i]+y[i];

  for (i=0;i<5;i++)
    cout << i << " " << sum[i] << endl;
}

  
