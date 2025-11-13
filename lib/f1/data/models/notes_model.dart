
class NotesModel {
  NotesModel({
    required this.title,
    required this.content,
    required this.date,
    this.id = 0,
  });

  final String title;
  final String content;
  final String date;
  final int id;


  NotesModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        date = json["date"],
        content = json["content"],
        id = json["id"] ;
}
// named constructor that takes a map and return it as dart object (NotesModel)
