import 'package:flutter/material.dart';
import '../models/specialty.dart';

class SpecialtyCard extends StatelessWidget {
  final Specialty specialty;

  const SpecialtyCard({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(specialty.icon, color: Colors.blue),
          const SizedBox(width: 8),
          Text(specialty.name, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}