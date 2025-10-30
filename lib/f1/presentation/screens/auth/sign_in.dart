import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/Custom_text_field.dart';
import 'package:formula1_fantasy/routes/routes.dart';

import '../../../data/local/local_storage.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    const f1Red = Color(0xFFE10600);
    const deepRed = Color(0xFF7A0000);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [f1Red, deepRed, Color(0xFF0F0F10)],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.sports_motorsports,
                      //   color: Colors.white,
                      //   size: 150,
                      // ),
                      SvgPicture.asset(
                        'assets/images/F1_logo.svg',
                        height: 70,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Fantasy",
                        style: TextStyle(
                          fontFamily: "TitilliumWeb",
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Let's Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        isPassword: false,
                        hint: "Email",
                        controller: emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        isPassword: true,
                        hint: "Password",
                        controller: passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!passwordRegex.hasMatch(password)) {
                            return 'Password must have upper, lower, number, and special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You Don't Have an Account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.9,
                                color: f1Red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: f1Red,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide.none,
                            ),
                          ),
                          onPressed: () {
                            login(context);
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await LocalStorageData().saveUsername(emailController.text);
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }
}
