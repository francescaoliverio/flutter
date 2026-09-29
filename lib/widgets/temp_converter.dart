/*
 * Francesca Oliverio
 * 22/09/2026
*/

import 'dart:io';

void main() {
  num tempC = 24.5;
  num tempF = 79;
  num? tempCtoF = tempConverter(tempC, "C");
  num? tempFtoC = tempConverter(tempF, "F");
  if (tempCtoF == null || tempFtoC == null) {
    stdout.write("Oops! Something went wrong!\n");
  } else {
    stdout.write("$tempC°C are $tempCtoF°F\n");
    stdout.write("$tempF°F are $tempFtoC°C\n");
  }
}

num? tempConverter(num temp, String degrees) {
  if (degrees == "C") {
    return (temp * 9 / 5) + 32;
  } else if (degrees == "F") {
    return (temp - 32) * 5 / 9;
  } else {
    return null;
  }
}
