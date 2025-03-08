import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(question.doctorImage),
        ),
        title: Text(
          question.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(question.description),
      ),
    );
  }
}