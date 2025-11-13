import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/presentation/providers/notes_provider.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/notes_widget.dart';
import 'package:formula1_fantasy/routes/routes.dart';
import 'package:provider/provider.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List<NotesModel> notes = [
    //   NotesModel(
    //     title: "title",
    //     content: "content",
    //     date: "${DateTime.now().day}/${DateTime.now().month}",
    //   ),
    // ];

    const darkBg = Color(0xFF0F0F10);
    const f1Red = Color(0xFFE10600);

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: darkBg,
        title: const Text(
          'Race Notes',
          style: TextStyle(color: Colors.white, fontFamily: "TitilliumWeb"),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: provider.notes.isEmpty
                ? const Center(
                    child: Text(
                      'No race notes yet.\nTap + to log your first Grand Prix! 🏎️💨 ',

                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: provider.notes.length,
                    itemBuilder: (context, index) {
                      return NotesWidget(
                        model: provider.notes[index],
                        onDismissed: (_) {
                          provider.deleteNote(provider.notes[index]);
                        },
                      );
                    },
                  ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addNote);
        },
        backgroundColor: f1Red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
