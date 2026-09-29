/*
 * Francesca Oliverio
 * 22/09/2026
*/

void main() {
  num tempC = 24.5;
  num tempF = 79;
  num? tempCtoF = tempConverter(tempC, "C");
  num? tempFtoC = tempConverter(tempF, "F");
  if (tempCtoF == null || tempFtoC == null) {
    print("Oops! Something went wrong!");
  } else {
    print("$tempC°C are $tempCtoF°F");
    print("$tempF°F are $tempFtoC°C");
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
