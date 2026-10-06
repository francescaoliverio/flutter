/*
 * Francesca Oliverio
 * 06/10/2026
*/

import 'dart:io';

// 1. Shape → Circle / Rectangle + area()

abstract class Shape {
  double area();
  double perimeter();
  void calcArea() => stdout.write("${area()}\n");
  void calcPerimeter() => stdout.write("${perimeter()}\n");
}

class Rectangle extends Shape {
  double width = 0;
  double height = 0;

  @override
  double area() => width * height;
  @override
  double perimeter() => (width + height) * 2;
}

class Circle extends Shape {
  double radius = 0;
  static const pi = 3.1415926535;

  @override
  double area() => pi * radius * radius;
  @override
  double perimeter() => 2 * pi * radius;
}

// 2. Animal / Dog / Cat + override

class Animal {
  bool? isAlive;
  int paws;

  Animal({this.isAlive, this.paws = 0});

  void sound() => stdout.write("...\n");
}

class Mammal extends Animal {
  String? furColor;

  Mammal({super.isAlive, super.paws = 4, this.furColor});
}

class Dog extends Mammal {
  @override
  void sound() => stdout.write("WOOF!\n");
}

class Cat extends Mammal {
  @override
  void sound() => stdout.write("MEOW!\n");
}

// 3. Mixin Logger + 2 classes

mixin Logger {
  void log(String m) => stdout.write("[LOG]: $m\n");
}

class Light with Logger {
  void turnOn() => log("ON");
  void turnOff() => log("OFF");
}

class Car with Logger {
  void run() => log("Running...");
  void crash() => log("Crashed!");
}

// 4. Named fromJson + const
// ??? Unclear assignment ???
