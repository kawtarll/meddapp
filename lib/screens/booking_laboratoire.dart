import 'package:flutter/material.dart';

class LaboratoriesScreen extends StatelessWidget {
  const LaboratoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laboratoires Médicaux"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Liste des laboratoires disponibles :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Exemple de 5 laboratoires
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.biotech, size: 40, color: Colors.purple),
                      title: Text("Laboratoire ${index + 1}"),
                      subtitle: const Text("Spécialité : Analyses Médicales"),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Action pour réserver une analyse
                        },
                        child: const Text("Réserver"),
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