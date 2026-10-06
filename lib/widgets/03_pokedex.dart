/*
 * Francesca Oliverio
 * 29/09/2026
 */

/* ===== Pokédex tascabile =====
 * - Gestisci una squadra da terminale
 * - Nome + livello (1...100) + stato
 * - Demo: 2 Pokémon, evolvi, filtra
 * MENU
 * 1) Aggiungi Pokémon
 * 2) Evolvi (+ livello, max 100)
 * 3) Cambia stato
 * 4) Scheda + messaggioStato()
 * 5) Filtra per stato
 * 0) Esci — input invalidi gestiti
 * =============================
 */

import 'dart:io';

// ===== ENUM =====

enum Tipo {
  erba('Erba', '🌿'),
  fuoco('Fuoco', '🔥'),
  acqua('Acqua', '💧'),
  elettro('Elettro', '⚡'),
  psico('Psico', '🔮'),
  veleno('Veleno', '☠️'),
  volante('Volante', '🕊️'),
  roccia('Roccia', '🪨'),
  terra('Terra', '🌍'),
  normale('Normale', '⚪'),
  buio('Buio', '🌑'),
  lotta('Lotta', '🥊'),
  acciaio('Acciaio', '⚙️');

  const Tipo(this.nome, this.emoji);
  final String nome;
  final String emoji;
}

enum Stato {
  normale,
  poisoned,
  paralyzed,
  burned,
  asleep,
  frozen;

  String messaggio(String nome) => switch (this) {
    Stato.normale => '$nome sta bene.',
    Stato.poisoned => '$nome è avvelenato!',
    Stato.paralyzed => '$nome è paralizzato!',
    Stato.burned => '$nome è scottato!',
    Stato.asleep => '$nome sta dormendo.',
    Stato.frozen => '$nome è congelato!',
  };
}

// ===== "DATABASE" POKÉMON (Diamante) =====
// Template a dati fissi: tipo = tipo del Pokémon base (le evoluzioni possono
// averne altri). Tipi come in gen 4 (niente Folletto: Cleffa = Normale).
// 'livello': null = evoluzione senza livello (vedi 'metodo').

final List<Map<String, dynamic>> database = [
  {
    'nome': 'Turtwig',
    'evoluzioni': [
      {'nome': 'Grotle', 'livello': 18, 'metodo': 'livello'},
      {'nome': 'Torterra', 'livello': 32, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.erba],
  },
  {
    'nome': 'Chimchar',
    'evoluzioni': [
      {'nome': 'Monferno', 'livello': 14, 'metodo': 'livello'},
      {'nome': 'Infernape', 'livello': 36, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.fuoco],
  },
  {
    'nome': 'Piplup',
    'evoluzioni': [
      {'nome': 'Prinplup', 'livello': 16, 'metodo': 'livello'},
      {'nome': 'Empoleon', 'livello': 36, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.acqua],
  },
  {
    'nome': 'Shinx',
    'evoluzioni': [
      {'nome': 'Luxio', 'livello': 15, 'metodo': 'livello'},
      {'nome': 'Luxray', 'livello': 30, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.elettro],
  },
  {
    'nome': 'Abra',
    'evoluzioni': [
      {'nome': 'Kadabra', 'livello': 16, 'metodo': 'livello'},
      {'nome': 'Alakazam', 'livello': null, 'metodo': 'scambio'},
    ],
    'tipo': [Tipo.psico],
  },
  {
    'nome': 'Zubat',
    'evoluzioni': [
      {'nome': 'Golbat', 'livello': 22, 'metodo': 'livello'},
      {'nome': 'Crobat', 'livello': null, 'metodo': 'amicizia'},
    ],
    'tipo': [Tipo.veleno, Tipo.volante],
  },
  {
    'nome': 'Geodude',
    'evoluzioni': [
      {'nome': 'Graveler', 'livello': 25, 'metodo': 'livello'},
      {'nome': 'Golem', 'livello': null, 'metodo': 'scambio'},
    ],
    'tipo': [Tipo.roccia, Tipo.terra],
  },
  {
    'nome': 'Glameow',
    'evoluzioni': [
      {'nome': 'Purugly', 'livello': 38, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.normale],
  },
  {
    'nome': 'Stunky',
    'evoluzioni': [
      {'nome': 'Skuntank', 'livello': 34, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.veleno, Tipo.buio],
  },
  {
    'nome': 'Meditite',
    'evoluzioni': [
      {'nome': 'Medicham', 'livello': 37, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.lotta, Tipo.psico],
  },
  {
    'nome': 'Bronzor',
    'evoluzioni': [
      {'nome': 'Bronzong', 'livello': 33, 'metodo': 'livello'},
    ],
    'tipo': [Tipo.acciaio, Tipo.psico],
  },
  {
    'nome': 'Cleffa',
    'evoluzioni': [
      {'nome': 'Clefairy', 'livello': null, 'metodo': 'amicizia'},
      {'nome': 'Clefable', 'livello': null, 'metodo': 'Pietralunare'},
    ],
    'tipo': [Tipo.normale],
  },
  {
    'nome': 'Pikachu',
    'evoluzioni': [
      {'nome': 'Raichu', 'livello': null, 'metodo': 'Pietratuono'},
    ],
    'tipo': [Tipo.elettro],
  },
];

// ===== CLASSE POKEMON =====
// Ogni oggetto è una COPIA di un template del database:
// livello e stato appartengono al singolo Pokémon, non al template.

class Pokemon {
  final String _nomeBase;
  String _nome; // Se evoluto, mostra nome evoluzione
  int _livello;
  Stato _stato = Stato.normale;
  final List<Tipo> _tipo;
  final List<Map<String, dynamic>> _evoluzioni;
  int _stadio = 0; // 0 = base, 1 = prima evoluzione, 2 = seconda evoluzione

  Pokemon.daTemplate(Map<String, dynamic> templateP, int livello)
    : _nomeBase = templateP['nome'],
      _nome = templateP['nome'],
      _livello = _controllaLivello(livello),
      _stato = templateP['stato'],
      _tipo = List<Tipo>.from(templateP['tipo']),
      _evoluzioni = List<Map<String, dynamic>>.from(templateP['evoluzioni']);

  static int _controllaLivello(int value) {
    if (value < 1 || value > 100) throw ArgumentError('Livello fuori range (1-100)');
    return value;
  }

  // --- getter ---
  String get nomeBase => _nomeBase;
  String get nome => _nome;
  int get livello => _livello;
  Stato get stato => _stato;
  List<Tipo> get tipo => List.unmodifiable(_tipo);

  // --- setter ---
  set livello(int value) {
    _livello = _controllaLivello(value);
  }

  set stato(Stato s) {
    _stato = s; // nessuna validazione: un valore di Stato è sempre valido
  }

  // --- azioni ---
  bool alzaLivello() {
    if (_livello >= 100) return false;
    _livello++;
    return true;
  }

  bool evolvi() {
    final int? lvRichiesto = _stadio < _evoluzioni.length
        ? _evoluzioni[_stadio]['livello']
        : null;

    if (lvRichiesto == null) {
      stdout.write('Non è possibile evolvere $_nome.\n');
      return false;
    }
    if (_livello < lvRichiesto) {
      stdout.write(
        '$_nome deve essere almeno al livello $lvRichiesto per evolversi.\n',
      );
      return false;
    }
    _nome = _evoluzioni[_stadio]['nome'];
    _stadio++;
    return true;
  }

  String messaggioStato() => _stato.messaggio(_nome);

  @override
  String toString() {
    final emoji = _tipo.map((t) => t.emoji).join(' ');
    return '$_nome | Lv. $_livello | ${_stato.name} | $emoji';
  }
}

// ===== MY TEAM =====

final List<Pokemon> myTeam = [];

// ===== MAIN + MENU =====

void main() {
  menu();
}

void menu() {
  bool exit = false;
  String input = "";
  while (!exit) {
    stdout.write("\nHello! Choose one of the following actions:\n");
    stdout.write("1. Aggiungi Pokémon\n");
    stdout.write("2. Evolvi Pokémon\n");
    stdout.write("3. Scheda\n");
    stdout.write("4. Cambia stato\n");
    stdout.write("5. Filtra per stato\n");
    stdout.write("Other choices will end execution.\n");
    input = stdin.readLineSync()?.trim() ?? "";
    switch (input) {
      case "1":
      // addP();
      case "2":
      // evolveP();
      case "3":
      // readP();
      case "4":
      // stateP();
      case "5":
      // filterP();
      default:
        stdout.write("Are you sure you want to leave? [Y/N]\n");
        input = stdin.readLineSync()?.trim().toLowerCase() ?? "";
        if (input == "y") {
          stdout.write("Goodbye!\n\n");
          exit = true;
        } else if (input == "n") {
          stdout.write("Ok, keep playing.\n");
        } else {
          stdout.write("Invalid choice.\n");
        }
    }
  }
}
