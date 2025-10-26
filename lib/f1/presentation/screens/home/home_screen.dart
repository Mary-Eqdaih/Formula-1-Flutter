import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula1_fantasy/f1/data/local/local_storage.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/screens/home/home.dart';
import 'package:formula1_fantasy/f1/presentation/screens/leader_board/leader_board.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'package:provider/provider.dart';
import '../teams/teams.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var teamsProvider = Provider.of<F1Provider>(context);
    final List<Widget> screens = [Home(), Teams(), LeaderBoard()];
    const f1Red = Color(0xFFE10600);
    const darkBg = Color(0xFF0F0F10);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkBg,
        selectedItemColor: f1Red,
        unselectedItemColor: Colors.white60,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Teams"),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Leaderboard",
          ),
        ],
      ),
      backgroundColor: darkBg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: f1Red,
        onPressed: () {
          Navigator.pushNamed(context, Routes.notes);
        },
        child: const Icon(Icons.note_add,color: Colors.white,fontWeight: FontWeight.bold,),
      ),

      appBar: AppBar(
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
            icon: Badge.count(
              count: teamsProvider.favs.length,
              child: const Icon(Icons.favorite_border, color: Colors.white),
            ),
            onPressed: () => Navigator.pushNamed(context, Routes.favs),
          ),
          // NEW: overflow menu with Logout
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) async {
              switch (value) {
                case 'about':
                  Navigator.pushNamed(context, Routes.aboutF1); // open About F1
                  break;
                case 'logout':
                  await LocalStorageData().clearEmail();
                  Navigator.pushNamedAndRemoveUntil(context, Routes.signIn, (_) => false);
                  break;
              }

            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'about',  child: ListTile(leading: Icon(Icons.info_outline), title: Text('About F1'))),
              PopupMenuItem(value: 'logout', child: ListTile(title: Text('Logout'),leading: Icon(Icons.logout),)),

            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: screens[selectedIndex],
      ),
    );
  }
}
