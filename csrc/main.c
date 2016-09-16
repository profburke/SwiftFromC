//
// @file main.c
// @project SwiftFromC
// @author Matthew M. Burke <matthew.burke@captialone.com>
// @version 1.0 (2016-07-15)
//
// A main routine that invokes a few functions written in Swift.
//

#include <stdio.h>
#include "swiftfromc.h"

int main() {
  printf("Swift is giving us an int: %d\n", retrieveAnInt());
  printf("And now we get back a double: %f\n", retrieveADouble());
  printf("A message from Swift: %s\n", stringToC());
  return 0;
}

