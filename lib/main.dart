import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_fantasy/f1/cubit/auth_cubit.dart';
import 'package:formula1_fantasy/f1/data/local/local_storage.dart';
import 'package:formula1_fantasy/f1/data/local/notes_DB.dart';
import 'package:formula1_fantasy/f1/presentation/providers/f1_provider.dart';
import 'package:formula1_fantasy/f1/presentation/providers/notes_provider.dart';
import 'package:formula1_fantasy/f1/presentation/screens/aboutF1/about.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_in.dart';
import 'package:formula1_fantasy/f1/presentation/screens/auth/sign_up.dart';
import 'package:formula1_fantasy/f1/presentation/screens/favorites/favorites.dart';
import 'package:formula1_fantasy/f1/presentation/screens/notes/add_note.dart';
import 'package:formula1_fantasy/f1/presentation/screens/teams/teams_details.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'package:provider/provider.dart';
import 'f1/presentation/screens/home/home_screen.dart';
import 'f1/presentation/screens/notes/notes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotesDB.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? username;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    final user = await LocalStorageData().getSUsername();
    setState(() {
      username = user;
      isLoading = false;
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => F1Provider()..init()),
        ChangeNotifierProvider(create: (_) => NotesProvider()..fetchNotes()),
      ],

      child: BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(),
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'TitilliumWeb'),
          routes: {
            Routes.signIn: (context) => SignIn(),
            Routes.signUp: (context) => SignUp(),
            Routes.home: (context) => HomeScreen(),
            Routes.teamDetails: (context) => TeamDetails(),
            Routes.favs: (context) => Favorites(),
            Routes.notes: (context) => Notes(),
            Routes.aboutF1: (context) => aboutF1(),
            Routes.addNote: (context) => AddNote(),
          },
          debugShowCheckedModeBanner: false,
          // home: HomeScreen(),
          home: username == null ? SignIn() : HomeScreen(),
        ),
      ),
    );
  }
}
