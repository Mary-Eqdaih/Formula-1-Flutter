import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_in.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_up.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'f1/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      Routes.signIn: (context) => SignIn(),
      Routes.signUp: (context) => SignUp(),
      Routes.home: (context) => HomeScreen(),

      },
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
