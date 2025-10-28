// import 'package:flutter/material.dart';
// import 'package:formula1_fantasy/f1/presentation/providers/notes_provider.dart';
// import 'package:provider/provider.dart';
// class AddNote extends StatelessWidget {
//   const AddNote({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var notesProvider = Provider.of<NotesProvider>(context);
//     const darkBg = Color(0xFF0F0F10);
//     const f1Red = Color(0xFFE10600);
//
//     return Scaffold(
//       backgroundColor: darkBg,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: darkBg,
//         title: Text("New Note",style: TextStyle(color: Colors.white),),
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:formula1_fantasy/f1/data/models/notes_model.dart';
import 'package:formula1_fantasy/f1/presentation/providers/notes_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  static const darkBg = Color(0xFF0F0F10);

  static const f1Red  = Color(0xFFE10600);

  final _title = TextEditingController();
  final _body  = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  void _save() {
    final title = _title.text.trim();
    final content = _body.text.trim();
    if (title.isEmpty && content.isEmpty) {
      Navigator.pop(context); // nothing to save
      return;
    }

    final note = NotesModel(
      title: title.isEmpty ? 'Untitled' : title,
      content: content,
      date: "${DateTime.now().day}/${DateTime.now().month}",
    );

    context.read<NotesProvider>().addNote(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBg,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "New Note",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          // simple Save action on the AppBar
          TextButton(
            onPressed: _save,
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TITLE CARD
            _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Label('Title'),
                  TextField(
                    controller: _title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: f1Red,
                    decoration: const InputDecoration(
                      hintText: 'e.g. Mexico GP — Lap 35 strategy switch',
                      hintStyle: TextStyle(color: Colors.white38),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _Pill(icon: Icons.event, text: _prettyDate(DateTime.now())),
                      const SizedBox(width: 8),
                      _Pill(icon: Icons.note_alt_outlined, text: 'Race Notes'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // BODY CARD
            _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Label('Notes'),
                  TextField(
                    controller: _body,
                    cursorColor: f1Red,
                    maxLines: null,
                    minLines: 10,
                    style: const TextStyle(
                      color: Colors.white,
                      height: 1.35,
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                      hintText:
                      'Write your race notes...\n• Pit windows, tyre choices\n• Fuel saving laps\n• Overtakes & incidents\n• Setup changes, radio messages',
                      hintStyle: TextStyle(color: Colors.white38),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // FOOTER BUTTONS
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: const Text('Discard',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: f1Red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.check_rounded, size: 18),
                    label: const Text('Save',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static String _prettyDate(DateTime d) {
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun',
      'Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

/* ---------- small UI bits (same visual style) ---------- */

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;

  static const card = Color(0xFF18191A);
  static const f1Red = Color(0xFFE10600);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: f1Red.withOpacity(0.20)),
      ),
      child: child,
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 12,
        letterSpacing: .4,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white70),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
