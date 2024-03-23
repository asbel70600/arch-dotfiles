#include <iostream>
using namespace std;

int eso(int, int);

int main(int arc, char **argv) {
  cout << "hellomoto" << endl;
  int a;
  a = eso(1, 2);

  return a;
}

int eso(int a, int b) { return a * b; }
