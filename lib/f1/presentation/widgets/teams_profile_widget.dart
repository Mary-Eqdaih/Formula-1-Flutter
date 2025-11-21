import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';
import 'package:formula1_fantasy/routes/routes.dart';  // Make sure to import your TeamsModel class

class ProfileFavoriteTeamWidget extends StatelessWidget {
  final TeamsModel team;

  const ProfileFavoriteTeamWidget({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.teamDetails,arguments: team);
      },
      child: Card(

        color: darkBg,
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Margin between the cards
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between name and points
            children: [
              // Team Name
              Text(
                team.teamName, // Display team name
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              // Team Points
              Text(
                "${team.points} points", // Display points
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
