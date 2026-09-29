/*
 * Francesca Oliverio
 * 22/09/2026
*/

import 'dart:io';

void main() {
  final String operator = "/";
  final num num1 = 13;
  final num num2 = 0;
  switch (operator) {
    case "+":
      num sumRes = sum(num1, num2);
      stdout.write("$num1 + $num2 = $sumRes\n");
    case "-":
      num subRes = sub(num1, num2);
      stdout.write("$num1 - $num2 = $subRes\n");
    case "*":
      num mulRes = mul(num1, num2);
      stdout.write("$num1 * $num2 = $mulRes\n");
    case "/":
      num? divRes = div(num1, num2);
      if (divRes == null) {
        stdout.write("You can't divide a number by 0.\n");
      } else {
        stdout.write("$num1 / $num2 = $divRes\n");
      }
    default:
      stdout.write("Choose a valid operator.\n");
  }
}

// +
num sum(num x, y) => x + y;

// -
num sub(num x, y) => x - y;

// *
num mul(num x, y) => x * y;

// /
num? div(num x, y) {
  if (y == 0) {
    return null;
  } else {
    return x / y;
  }
}
