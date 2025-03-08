import 'package:flutter/material.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pharmacies Disponibles"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Liste des pharmacies ouvertes :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Exemple de 5 pharmacies
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_pharmacy, size: 40, color: Colors.green),
                      title: Text("Pharmacie ${index + 1}"),
                      subtitle: const Text("Adresse : Rue Exemple, Ville"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Action pour réserver ou afficher les détails
                        },
                        child: const Text("Voir"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}