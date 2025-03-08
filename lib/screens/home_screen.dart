import 'package:flutter/material.dart';
import '../widget/speciality_card.dart';
import '../widget/qr_scan_banner.dart';
import 'signin_screen.dart';
import '../widget/category_nav.dart';
import '../models/specialty.dart';
import '../widget/question_card.dart';
import '../widget/article_card.dart';
import '../models/question.dart';
import '../models/article.dart';
import 'booking_pharmacie.dart';
import 'booking_laboratoire.dart';
import 'booking_medicaments.dart';
import 'favoris.dart';
import 'booking_medcin.dart';


class HomeScreen extends StatelessWidget {
  final Function changeLanguage;  // Fonction pour changer la langue
  final Function toggleTheme;     // Fonction pour basculer le thème

  // Constructeur avec les deux fonctions
  const HomeScreen({super.key, required this.changeLanguage, required this.toggleTheme}); // Required constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MediSphere",
          style: TextStyle(color: Color.fromARGB(255, 184, 228, 231), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Color.fromARGB(255, 184, 228, 231)),
            onPressed: () {
              _showLanguageDialog(context);  // Afficher la boîte de dialogue pour choisir la langue
            },
          ),
          IconButton(
            icon: const Icon(Icons.nightlight_round, color: Color.fromARGB(255, 153, 208, 217)),
            onPressed: () {
              toggleTheme();  // Call the toggle function
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.pushNamed(context, "/favorites");
            },
          ),
          TextButton.icon(
            onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SigninScreen()),
    );

            },
            icon: const Icon(Icons.person, color: Color.fromARGB(255, 182, 213, 227)),
            label: const Text(
              "Se connecter",
              style: TextStyle(color: Color.fromARGB(255, 176, 206, 231)),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 13, 20, 78),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Que cherchez-vous ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    IconButton(
      icon: const Icon(Icons.medical_services, size: 40, color: Colors.blue),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingScreen()),
        );
      },
    ),
    IconButton(
      icon: const Icon(Icons.local_pharmacy, size: 40, color: Colors.green),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PharmaciesScreen()),
        );
      },
    ),
    IconButton(
      icon: const Icon(Icons.biotech, size: 40, color: Colors.purple),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LaboratoriesScreen()),
        );
      },
    ),
    IconButton(
      icon: const Icon(Icons.medication, size: 40, color: Colors.red),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MedicationsScreen()),
        );
      },
    ),
    IconButton(
      icon: const Icon(Icons.favorite, size: 40, color: Colors.orange),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesScreen()),
        );
      },
    ),
  ],
),


            const SizedBox(height: 10),

            // 🔹 Boutons interactifs
            Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _buildCategoryButton(context, "Médecins", Icons.local_hospital, "/booking"),
                _buildCategoryButton(context, "Pharmacies", Icons.store, "/pharmacies"),
                _buildCategoryButton(context, "Laboratoires", Icons.biotech, "/laboratories"),
                _buildCategoryButton(context, "Médicaments", Icons.medication, "/medications"),
                _buildCategoryButton(context, "Magazine", Icons.book, "/articles"),
                _buildCategoryButton(context, "Questions", Icons.question_answer, "/questions"),
              ],
            ),

            const SizedBox(height: 20),
            const CategoryNav(),

            const SizedBox(height: 20),
            const QRScanBanner(),

            // 🔹 Section Questions Médicales
            _buildSectionTitle(context, "Questions médicales", "/questions"),
            _buildQuestionsList(),

            const SizedBox(height: 20),

            // 🔹 Section Magazine
            _buildSectionTitle(context, "Magazine", "/articles"),
            _buildArticlesList(),
          ],
        ),
      ),
    );
  }
    void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Choisir une langue"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Français"),
              onTap: () {
                changeLanguage("fr");  // Changer la langue en français
                Navigator.pop(context); // Fermer la boîte de dialogue
              },
            ),
            ListTile(
              title: const Text("Anglais"),
              onTap: () {
                changeLanguage("en");  // Changer la langue en anglais
                Navigator.pop(context); // Fermer la boîte de dialogue
              },
            ),
          ],
        ),
      );
    },
  );
}


  /// 🔹 Bouton de catégorie cliquable
  Widget _buildCategoryButton(BuildContext context, String title, IconData icon, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  /// 🔹 Titre de section avec bouton "Voir tous"
  Widget _buildSectionTitle(BuildContext context, String title, String route) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: const Text("Voir tous"),
        ),
      ],
    );
  }

  /// 🔹 Liste des questions
  Widget _buildQuestionsList() {
    List<Question> questions = [
      Question(
        title: "Perte de poids",
        description: "Pourquoi je perds du poids après un effort physique ?",
        doctorName: "Mme Imen Farah",
        doctorImage: "assets/images/slpo.png",
      ),
      Question(
        title: "Coupe-faim",
        description: "J'ai toujours faim, que puis-je faire ?",
        doctorName: "Dr Ey...",
        doctorImage: "assets/images/sw.png",
      ),
    ];

    return Column(
      children: questions.map((question) => QuestionCard(question: question)).toList(),
    );
  }

  /// 🔹 Liste des articles
  Widget _buildArticlesList() {
    List<Article> articles = [
      Article(
        title: "Le Sommeil et le Poids",
        description: "Un Équilibre Essentiel pour la Santé",
        imageUrl: "assets/images/slpo.png",
        category: "Nutrition",
      ),
      Article(
        title: "النوم والوزن: توازن أساسي للصحة",
        description: "كيف يؤثر النوم على وزنك وصحتك؟",
        imageUrl: "assets/images/sw.png",
        category: "التغذية",
      ),
    ];

    return Column(
      children: articles.map((article) => ArticleCard(article: article)).toList(),
    );
  }
}