/*
 * Francesca Oliverio
 * 24/09/2026
*/

import "dart:io";

void main() {
  bool exit = false;
  String input = "";
  while (!exit) {
    stdout.write("\nHello! Choose one of the following actions:\n");
    stdout.write("1. Greeting\n");
    stdout.write("2. Calculator\n");
    stdout.write("3. Multiplication Table\n");
    stdout.write("Other choices will end execution.\n");
    input = stdin.readLineSync()?.trim() ?? "";
    switch (input) {
      case "1":
        greet();
      case "2":
        calc();
      case "3":
        mulTable();
      default:
        stdout.write("Goodbye!\n\n");
        exit = true;
    }
  }
}

// ===== 1. Greeting =====
void greet() {
  stdout.write("What's your name?\n");
  String input = stdin.readLineSync()?.trim() ?? "";
  String name = input.isEmpty ? "user" : input;
  stdout.write("Hello, $name\n");
}

// ===== 2. Calculator =====
num inputNumber() {
  num? parsedInput;
  while (parsedInput == null) {
    String input = stdin.readLineSync()?.trim() ?? "";
    parsedInput = num.tryParse(input);
    if (parsedInput == null) {
      stdout.write("Invalid number. Try again: ");
    }
  }
  return parsedInput;
}

String inputOperator() {
  List<String> validOperators = ["+", "-", "*", "/"];
  String? parsedInput;
  while (parsedInput == null) {
    String input = stdin.readLineSync()?.trim() ?? "";
    parsedInput = validOperators.contains(input) ? input : null;
    if (parsedInput == null) {
      stdout.write("Invalid operator. Try again: ");
    }
  }
  return parsedInput;
}

void calc() {
  stdout.write("First number: ");
  num x = inputNumber();
  stdout.write("Second number: ");
  num y = inputNumber();
  stdout.write("Operator [ + - * / ]: ");
  String operator = inputOperator();
  if (operator == "/" && y == 0) {
    stdout.write("You can't divide a number by 0.\n");
    return;
  }
  num res = switch (operator) {
    "+" => x + y,
    "-" => x - y,
    "*" => x * y,
    "/" => x / y,
    _ => -0, // Impossible to reach (previous validation)
  };
  stdout.write("$x $operator $y = $res\n");
}

// ===== 3. Multiplication Table =====
void mulTable() {
  stdout.write("Choose a number: ");
  num x = inputNumber();
  for (int i = 1; i < 11; i++) {
    num res = x * i;
    stdout.write("\t$x * $i = $res\n");
  }
}
