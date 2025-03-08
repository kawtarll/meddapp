import 'package:flutter/material.dart';

class CategoryNav extends StatelessWidget {
  const CategoryNav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.people, "label": "Médecins"},
      {"icon": Icons.local_pharmacy, "label": "Pharmacies"},
      {"icon": Icons.menu_book, "label": "Magazine"},
      {"icon": Icons.medication, "label": "Médicaments"},
      {"icon": Icons.question_answer, "label": "Questions"},
      {"icon": Icons.science, "label": "Laboratoire"}, // Ajout Laboratoire
      {"icon": Icons.star, "label": "Favoris"}, // Ajout Favoris
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      radius: 30,
                      child: Icon(category["icon"], size: 30, color: Colors.blue),
                    ),
                    const SizedBox(height: 5),
                    Text(category["label"]),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}