/*
 * Francesca Oliverio
 * 22/09/2026
*/

void main() {
  final String operator = "/";
  final num num1 = 13;
  final num num2 = 0;
  switch (operator) {
    case "+":
      num sumRes = sum(num1, num2);
      print("$num1 + $num2 = $sumRes");
    case "-":
      num subRes = sub(num1, num2);
      print("$num1 - $num2 = $subRes");
    case "*":
      num mulRes = mul(num1, num2);
      print("$num1 * $num2 = $mulRes");
    case "/":
      num? divRes = div(num1, num2);
      if (divRes == null) {
        print("You can't divide a number by 0.");
      } else {
        print("$num1 / $num2 = $divRes");
      }
    default:
      print("Choose a valid operator.");
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
