/*
 * Francesca Oliverio
 * 22/09/2026
*/

void main() {
  var io = Persona("Francesca", "Oliverio", 27, [28, 30, 29, 28]);
  io.hello();
}

class Persona {
  String nome;
  String cognome;
  int eta;
  List<double> grades;

  Persona(this.nome, this.cognome, this.eta, this.grades);

  double get media {
    if (grades.isEmpty) return 0;
    return grades.reduce((somma, voto) => somma + voto) / grades.length;
  }

  void hello() {
    print(
      "Ciao! Mi chiamo $nome $cognome, ho $eta anni e la mia media è $media",
    );
  }
}
