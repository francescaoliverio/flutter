/*
 * Francesca Oliverio
 * 24/04/2026
*/

import "dart:io";

void main() {
  String input = stdin.readLineSync()?.trim() ?? "";
  String name = input.isEmpty ? "user" : input;
  stdout.write("Hello, $name\n");
}
