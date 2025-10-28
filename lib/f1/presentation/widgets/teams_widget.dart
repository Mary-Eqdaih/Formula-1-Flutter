import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamsWidget extends StatelessWidget {
  const TeamsWidget({
    super.key,
    required this.model,
    this.isUsedInFavorites = false,
  });
  final TeamsModel model;
  final bool isUsedInFavorites;

  @override
  Widget build(BuildContext context) {
    var teamsProvider = Provider.of<F1Provider>(context);
    const cardColor = Color(0xFF18191A);
    const f1Red = Color(0xFFE10600);
    return InkWell(
      onTap: () {

        Navigator.pushNamed(context, Routes.teamDetails, arguments: model);
      },
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: f1Red.withOpacity(0.25), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: model.logo.endsWith('.svg')
                    ? SvgPicture.asset(model.logo, fit: BoxFit.contain)
                    : Image.asset(model.logo, fit: BoxFit.contain),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.teamName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'TitilliumWeb',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model.nationality,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontFamily: 'TitilliumWeb',
                        fontSize: 13,
                      ),
                    ),
                    TextButton.icon(

                      onPressed: () {
                        openWikipedia(model);
                      },
                      icon: const Icon(Icons.open_in_new, size: 16, color: Colors.white70),
                      label: const Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'TitilliumWeb',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  if (teamsProvider.favs.contains(model)) {
                    teamsProvider.removeFromFavorites(model);
                  } else {
                    teamsProvider.addToFavorites(model);
                  }
                },
                icon: teamsProvider.favs.contains(model)
                    ? isUsedInFavorites
                        ? Icon(Icons.favorite, color: f1Red)
                    : Icon(Icons.favorite, color: f1Red):
                    Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> openWikipedia(TeamsModel team) async {
    final primary = Uri.tryParse(team.wikiUrl ?? '');
    final uri = primary ?? Uri.parse(
      'https://en.wikipedia.org/w/index.php?search=${Uri.encodeComponent(team.teamName)}',
    );

    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }
}
