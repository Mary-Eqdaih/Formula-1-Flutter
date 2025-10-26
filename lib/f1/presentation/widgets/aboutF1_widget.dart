import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/data/models/about_F1_model.dart';

class AboutF1Widget extends StatelessWidget {
  const AboutF1Widget({super.key, required this.model});
  final AboutF1Model model;
  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);
    const card = Color(0xFF18191A);
    const f1Red = Color(0xFFE10600);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "TitilliumWeb"),),
          SizedBox(height: 10),
          Container(
            width: double.infinity,

            padding: EdgeInsetsGeometry.all(15),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: f1Red.withOpacity(0.12)),
            ),

            child: Text(
              model.body,
              style: const TextStyle(color: Colors.white70, height: 1.8,fontFamily: "TitilliumWeb"),
            ),

          ),

        ],
      ),
    );
  }
}
