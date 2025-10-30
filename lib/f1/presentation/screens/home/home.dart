import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/data/local/local_storage.dart';
import 'package:formula1_fantasy/f1/data/models/race_info_model.dart';
import 'package:formula1_fantasy/f1/data/remote/f1_api.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/race_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  RaceInfoModel? latestRace;
  RaceInfoModel? nextRace;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    loadEmail();
  }

  loadEmail() async {
    final savedUserName = await LocalStorageData().getSUsername();
    setState(() {
      userName = savedUserName;
    });
  }

  fetchData() async {
    final latest = await F1Api.fetchLatestRace();
    final next = await F1Api.fetchNextRace();
    // fetchLatestRace fetchNextRace ... functions thar return RaceInfoModel
    // assigned to vars also of type RaceInfoModel

    latestRace = latest;
    nextRace = next;

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const f1Red = Color(0xFFE10600);
    const gray = Color(0xFF424242);

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      children: [
        Row(
          children: [
            Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "TitilliumWeb",
              ),
            ),
            SizedBox(width: 5),
            Text(
              "${userName ?? 'Guest'}",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: "TitilliumWeb",
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.sports_motorsports, color: Colors.white, size: 30),
          ],
        ),
        SizedBox(height: 20),
        const Text(
          "Latest Race Result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'TitilliumWeb',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        RaceCardWidget(
          title: latestRace!.title,
          color: f1Red,
          subtitle: '${latestRace!.location} • ${latestRace!.circuit} • ${latestRace!.date}',
          result: 'Winner: ${latestRace!.winner} (${latestRace!.team})',
        ),

        const SizedBox(height: 30),
        const Text(
          "Upcoming Race",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'TitilliumWeb',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        RaceCardWidget(
          title: nextRace!.title,
          color: gray,
          subtitle: '${nextRace!.location} • ${nextRace!.circuit} • ${nextRace!.date} ',
          result: "Upcoming",
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
