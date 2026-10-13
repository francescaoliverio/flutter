/*
 * Francesca Oliverio
 * 13/10/2026
*/

import 'package:flutter/material.dart';

// MaterialApp
//     └─ Scaffold
//         ├─ AppBar
//         └─ body: Center
//             └─ Text("Ciao")

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "MSCHF",
            style: TextStyle(
              fontSize: 18,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF228844),
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 3,
          centerTitle: true,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: ProductCard(
              title: "MSCHF Supernormal 2",
              price: "\$170",
              imageUrl: "https://store.mschf.com/cdn/shop/files/mschf-supernormal2-marsblack-02.png",
              description: "There is only the intensification of the present; Supernormal is the new uniform. Fully liquified upper, from eyebrow to lace buckle. Materials/details: Full-grain leather upper, distorted/cut tongue, redesigned liquified sole.",
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x44E4C4A4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4C4A4), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Img + info btn in Stack
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.amber, width: 2),
                    ),
                    child: const Text(
                      "i",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Sezione Info
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Riga Titolo + Prezzo
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Descrizione
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 12),

                // Pulsante Aggiungi al carrello
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF228844),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Aggiungi al carrello",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
