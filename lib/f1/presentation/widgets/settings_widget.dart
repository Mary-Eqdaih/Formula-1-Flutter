import 'package:flutter/material.dart';
class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.title, required this.onTap, required this.icon});


  final String title;
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Color(0xFF18191A),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 30),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'TitilliumWeb',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );();
  }
}
