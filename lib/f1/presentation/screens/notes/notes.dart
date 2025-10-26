import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // Temporary mock data (you’ll replace this later with SQLite)
  final List<Map<String, String>> notes = [
    {'title': 'Monaco GP', 'body': 'Amazing race with tight corners 🏎️'},
    {'title': 'Silverstone', 'body': 'Rain changed everything ☔'},
    {'title': 'Spa', 'body': 'Verstappen dominated again 🚀'},
  ];

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);
    const f1Red = Color(0xFFE10600);

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: darkBg,
        title: const Text(
          'Race Notes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // 📝 Main body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: notes.isEmpty
            ? const Center(
          child: Text(
            'No notes yet.\nTap + to add one!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 16),
          ),
        )
            : ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: f1Red.withOpacity(0.3)),
              ),
              child: ListTile(
                title: Text(
                  note['title']!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                subtitle: Text(
                  note['body']!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.white54),
                onTap: () {
                  // Later: open note for editing
                },
              ),
            );
          },
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: f1Red,
        onPressed: () {
          Navigator.pushNamed(context, '/addNote'); // Go to AddNotePage
        },
        child: const Icon(Icons.add,color: Colors.white,fontWeight: FontWeight.bold,),
      ),
    );
  }
}
