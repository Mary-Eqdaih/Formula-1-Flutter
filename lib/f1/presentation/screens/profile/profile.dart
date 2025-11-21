import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/Custom_text_field.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/teams_profile_widget.dart';
import 'package:provider/provider.dart';


class Profile extends StatelessWidget {
  Profile({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var teamsProvider = Provider.of<F1Provider>(context);
    const f1Red = Color(0xFFE10600);
    const darkBg = Color(0xFF0F0F10);
    const gray = Color(0xFF424242);

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: darkBg,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/F1_logo.svg', height: 28),
            const SizedBox(width: 8),
            const Text(
              "Fantasy",
              style: TextStyle(
                fontFamily: 'TitilliumWeb',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: darkBg,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // edit
              Align(
                alignment: AlignmentGeometry.topRight,
                child: TextButton(
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
                          content: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(
                                context,
                              ).size.width, // Full screen width
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      const CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          "https://placehold.co/600x400/000000/FFFFFF/png",
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10,
                                        right: -10,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Edit Name",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Edit Email",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomTextField(
                                    controller: emailController,
                                    hint:
                                        FirebaseAuth
                                            .instance
                                            .currentUser
                                            ?.email ??
                                        "",
                                  ),
                                  SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Edit Bio",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomTextField(
                                    controller: bioController,
                                    hint: "Bio",
                                  ),
                                ],
                              ),
                            ),
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
                      Text(
                        "Edit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.edit, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://placehold.co/600x400/000000/FFFFFF/png",
                ),
              ),
              const SizedBox(height: 20),
              // name
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 5),
              // email
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              // bio
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Passionate about F1 and technology.',
                  style: TextStyle(color: Colors.yellow, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              // favs
              teamsProvider.favs.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: gray,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Favorite Teams',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              // Display the list of favorite teams
                              Column(
                                children: teamsProvider.favs.map((team) {
                                  return ProfileFavoriteTeamWidget(team: team);
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No favorite teams yet.',
                      style: TextStyle(color: Colors.white),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
