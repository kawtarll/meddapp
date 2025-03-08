import 'package:flutter/material.dart';
import '../models/article.dart';
import '../widget/article_card.dart';

class ArticlesScreen extends StatelessWidget {
  final List<Article> articles = [
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

 ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magazine Médical"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(article: articles[index]);
        },
      ),
    );
  }
}
