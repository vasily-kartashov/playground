#include <stdio.h>

void greet(int n) {
  for (int i = 0; i < 5; i++) {
    puts("Hello, World!");
  }
}

int main(int argc, char** argv) {
  greet(5);
  return 0;
}
