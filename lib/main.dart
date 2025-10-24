import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_in.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_up.dart';
import 'package:formula1_fantasy/f1/presentation/screens/favorites/favorites.dart';
import 'package:formula1_fantasy/f1/presentation/screens/teams/teams_details.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'package:provider/provider.dart';
import 'f1/presentation/screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return F1Provider()..fetchTeams(); },
      child: MaterialApp(
        routes: {
        Routes.signIn: (context) => SignIn(),
        Routes.signUp: (context) => SignUp(),
        Routes.home: (context) => HomeScreen(),
        Routes.teamDetails: (context) =>TeamDetails(),
        Routes.favs: (context) =>Favorites(),

        },
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
