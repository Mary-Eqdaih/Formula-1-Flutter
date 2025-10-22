import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../routes/routes.dart';
import '../../../data/local/local_storage.dart';
import '../../widgets/Custom_text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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
                      SizedBox(height: 30),
                      Text(
                        "Welcome To Formula 1",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(height: 30),

                      CustomTextField(
                        isPassword: false,
                        hint: "Username",
                        controller: usernameController,
                        validator: (username) {
                          if (username == null || username.isEmpty) {
                            return 'Please enter your email';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        isPassword: false,
                        hint: "Email",
                        controller: emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!emailRegex.hasMatch(email)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
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
                      CustomTextField(
                        controller: confirmPasswordController,
                        isPassword: true,
                        hint: "Confirm Password",
                        validator: (confirm) {
                          if (confirm == null || confirm.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (confirm != passwordController.text) {
                            return "Passwords doesn't match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have an Account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signIn);
                            },
                            child: Text(
                              "Sign In",
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
                            "Sign Up",
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

  login(BuildContext context)  {
    if (_formKey.currentState!.validate()) {
       LocalStorageData().saveEmail(usernameController.text);
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }
}
