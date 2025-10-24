import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/teams_widget.dart';
import 'package:provider/provider.dart';



class Teams extends StatelessWidget {
  const Teams({super.key});

  @override
  Widget build(BuildContext context) {

    var teamsProvider = Provider.of<F1Provider>(context);

    const darkBg = Color(0xFF0F0F10);
    return Scaffold(
      backgroundColor: darkBg,

      body: ListView.builder(
        itemBuilder: (context, index) {
          return TeamsWidget(model: teamsProvider.teams[index]);
        },

        itemCount: teamsProvider.teams.length,
      ),
    );
  }
}
