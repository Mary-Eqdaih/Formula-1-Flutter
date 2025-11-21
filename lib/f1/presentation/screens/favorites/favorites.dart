import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/teams_widget.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    var teamsProvider = Provider.of<F1Provider>(context);
    const darkBg = Color(0xFF0F0F10);

    return Scaffold(
      backgroundColor: darkBg,
      body: teamsProvider.favs.isEmpty
          ? const Center(
        child: Text(
          "Nothing Added to Favorites",
          style: TextStyle(color: Colors.white),
        ),
      )
          : Expanded(
                child: ListView.builder(
                  itemCount: teamsProvider.favs.length,
                  itemBuilder: (context, index) {
                    return TeamsWidget(model: teamsProvider.favs[index],isUsedInFavorites: true, );
                  },
                ),
              ),


    );
  }
}
