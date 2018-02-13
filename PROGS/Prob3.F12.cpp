#include <iostream>
using namespace std;

int x[] = {0, 29, 13, 9, 0, 3, 7, 7};
int ascend[8] = {0};
int main() {
  int j = 0;
  for (int i=0; i<7; i++) {
    if (x[i] < x[i+1]) {
      ascend[j] = i;
      j++;
    }
  }

  for (int i=0; i<j; i++) {
    cout << ascend[i] << endl;
  }

}

