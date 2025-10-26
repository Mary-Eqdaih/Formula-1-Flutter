

class NotesModel {
  NotesModel(
      { required this.title, required this.content, required this.date, this.id = 0});

  final String title;
  final String content;
  final String date;
  final int id;


}