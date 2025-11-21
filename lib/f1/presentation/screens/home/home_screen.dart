
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formula1_fantasy/f1/cubit/auth_cubit.dart';
import 'package:formula1_fantasy/f1/presentation/screens/favorites/favorites.dart';
import 'package:formula1_fantasy/f1/presentation/screens/home/home.dart';
import 'package:formula1_fantasy/f1/presentation/screens/leaderboard/leaderboard.dart';
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
    final List<Widget> screens = [Home(), Teams(), Favorites(), Leaderboard()];
    const f1Red = Color(0xFFE10600);
    const darkBg = Color(0xFF0F0F10);
    const gray = Color(0xFF424242);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: darkBg,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: gray),
              child: Expanded(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://placehold.co/600x400/000000/FFFFFF/png'),
                    ),
                    const SizedBox(width: 20),
                   Expanded(child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         FirebaseAuth.instance.currentUser!.displayName ??
                             "User",
                         style: TextStyle(color: Colors.white, fontSize: 20),
                       ),
                       SizedBox(height: 5),
                       Text(
                         FirebaseAuth.instance.currentUser!.email ?? "Email",
                         style: TextStyle(color: Colors.white, fontSize: 14),
                       ),
                     ],
                   ),),
                    const SizedBox(width: 10),
                
                    // IconButton(onPressed: (){
                    //   Navigator.pushNamed(context, Routes.profile);
                    // }, icon: Icon(Icons.edit,color:Colors.white,))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
            ),

            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, Routes.profile);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white),
              title: Text('About F1', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, Routes.aboutF1);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Sign Out', style: TextStyle(color: Colors.white)),
              onTap: () {
                context.read<AuthCubit>().signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.signIn,
                      (r) => false,
                );

              },
            ),
          ],
        ),
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Leaderboard",
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.leaderboard),
          //   label: "Leaderboard",
          // ),
        ],
      ),
      backgroundColor: darkBg,
      floatingActionButton:
          // selectedIndex == 3 ? null :
          FloatingActionButton(
            backgroundColor: f1Red,
            onPressed: () {
              Navigator.pushNamed(context, Routes.notes);
            },
            child: const Icon(
              Icons.note_add,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the Drawer
              },
            );
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
          // PopupMenuButton<String>(
          //   icon: const Icon(Icons.more_vert, color: Colors.white),
          //   onSelected: (value) async {
          //     switch (value) {
          //       case 'about':
          //         Navigator.pushNamed(context, Routes.aboutF1); // open About F1
          //         break;
          //       case 'logout':
          //         context.read<AuthCubit>().signOut();
          //         Navigator.pushNamedAndRemoveUntil(
          //           context,
          //           Routes.signIn,
          //           (r) => false,
          //         );
          //         break;
          //     }
          //   },
          //   itemBuilder: (context) => const [
          //     PopupMenuItem(
          //       value: 'about',
          //       child: ListTile(
          //         leading: Icon(Icons.info_outline),
          //         title: Text('About F1'),
          //       ),
          //     ),
          //     PopupMenuItem(
          //       value: 'logout',
          //       child: ListTile(
          //         title: Text('Logout'),
          //         leading: Icon(Icons.logout),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: screens[selectedIndex],
      ),
    );
  }
}
