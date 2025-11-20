import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/Custom_text_field.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const f1Red = Color(0xFFE10600);
    const darkBg = Color(0xFF0F0F10);
    return Scaffold(
      backgroundColor: darkBg,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              const SizedBox(height: 20),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 5),

              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: f1Red,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ), // same pill shape as your "edit" btn
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: darkBg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text(
                          "Edit profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                        content: Column(
                          mainAxisSize:
                              MainAxisSize.min, // important for dialogs
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Edit Name",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 10,),
                            CustomTextField(
                              controller: nameController,
                              hint:
                                  FirebaseAuth
                                      .instance
                                      .currentUser
                                      ?.displayName ??
                                  "",
                            ),
                            const SizedBox(height: 16),
                            Text("Edit Email",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 10,),
                            CustomTextField(
                              controller: emailController,
                              hint:
                                  FirebaseAuth.instance.currentUser?.email ??
                                  "",
                            ),
                          ],
                        ),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey[400],
                            ),
                            child: const Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // .....
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: f1Red,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text("Save"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("edit"),
                    SizedBox(width: 5),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
