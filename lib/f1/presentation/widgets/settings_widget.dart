import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon, required this.cardTitle,  this.color = const Color(0xFF18191A),
  });

  final String title;
  final String cardTitle;
  final void Function()? onTap;
final Color color;


  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'TitilliumWeb',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: onTap,
            child: Card(
              color: color,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardTitle,
                      style: const TextStyle(
                        fontFamily: 'TitilliumWeb',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.chevron_right,color: Colors.white,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
