import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widget/question_card.dart';

class QuestionsScreen extends StatelessWidget {
  final List<Question> questions = [
    Question(
      title: "Perte de poids",
      description:
          "Aufait je voulais savoir pourquoi je perds du poids quand je fais un peu d'effort ou des allers-retours",
      doctorName: "Mme Imen Farah",
      doctorImage: "assets/images/logo.png",
    ),
    Question(
      title: "Coupe faim",
      description:
          "Aslema, j’ai un problème de faim constante. Je mesure 1,70m et je pèse...",
      doctorName: "Dr Ey...",
      doctorImage: "assets/images/logo.png",
    ),
  ];
QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions Médicales"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QuestionCard(question: questions[index]);
        },
      ),
    );
  }
}
