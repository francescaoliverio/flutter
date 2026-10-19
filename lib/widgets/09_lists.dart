/*
 * Francesca Oliverio
 * 19/10/2026
*/

import 'package:flutter/material.dart';

void main() {
  runApp(Rubrica());
}

class Rubrica extends StatelessWidget {
  const Rubrica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rubrica",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Rubrica"), centerTitle: true,),
        body: ElencoContatti(items: miaRubrica,),
      ),
    );
  }
}

class Contatto {
  final String nome;
  final String cognome;
  final String numero;

  Contatto({required this.nome, required this.cognome, required this.numero});
}

class ElencoContatti extends StatelessWidget {
  final List<Contatto> items;

  const ElencoContatti({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final contatto = items[index];
          final nome = contatto.nome;
          final cognome = contatto.cognome;
          final numero = contatto.numero;
      
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.indigo,),
            title: Text("$nome $cognome"),
            subtitle: Text(numero),
            trailing: Icon(Icons.favorite_border_outlined),
            onTap: () {},
          );
        },
      ),
    );
  }
}

final List<Contatto> miaRubrica = [
  Contatto(nome: "Francesca", cognome: "Rossi", numero: "3214567890"),
  Contatto(nome: "Alessia", cognome: "Verde", numero: "3314567890"),
  Contatto(nome: "Gaia", cognome: "Blu", numero: "3414567890"),
  Contatto(nome: "Francesce", cognome: "Rossi", numero: "3214567890"),
  Contatto(nome: "Alessie", cognome: "Verde", numero: "3314567890"),
  Contatto(nome: "Gaie", cognome: "Blu", numero: "3414567890"),
  Contatto(nome: "Francesci", cognome: "Rossi", numero: "3214567890"),
  Contatto(nome: "Alessii", cognome: "Verde", numero: "3314567890"),
  Contatto(nome: "Gaii", cognome: "Blu", numero: "3414567890"),
  Contatto(nome: "Francesco", cognome: "Rossi", numero: "3214567890"),
  Contatto(nome: "Alessio", cognome: "Verde", numero: "3314567890"),
  Contatto(nome: "Gaio", cognome: "Blu", numero: "3414567890"),
  Contatto(nome: "Francescu", cognome: "Rossi", numero: "3214567890"),
  Contatto(nome: "Alessiu", cognome: "Verde", numero: "3314567890"),
  Contatto(nome: "Gaiu", cognome: "Blu", numero: "3414567890"),
];