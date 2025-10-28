import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xffACACAC)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white70),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
