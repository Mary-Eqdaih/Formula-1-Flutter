import 'package:formula1_fantasy/f1/data/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesDB {
  static late Database _database;
  static String dbPath = "notes.db";
  static String tableName = "notes";
  static String id = "id";
  static String title = "title";
  static String content = "content";
  static String date = "date";

  static Future<void> init() async {
    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, title TEXT, $content TEXT, $date TEXT)',
        );
      },
      onOpen: (db) {
        print("Database Opened");
      },
    );
  }

  // CRUD Operations
  // insert Create
  static Future<int> insertNoteToDB(NotesModel note) async {
    int id = await _database.rawInsert(
      'INSERT INTO $tableName ($title ,$content ,$date ) VALUES ("${note.title}" , "${note.content}" , "${note.date}") ',
    );
    return id; //   (the inserted row’s ID).
  }

  static Future<List<NotesModel>> getNoteFromDB() async {
    var result = await _database.rawQuery(
      'SELECT * FROM  $tableName ',
    ); // list of rows, where each row is a map.
    List<NotesModel> notes = [];
    for (var map in result) {
      NotesModel note = NotesModel.fromJson(
        map,
      ); // defined in NotesModel class takes a map returns a dart object of type NotesModel in var note
      notes.add(note);
    }
    return notes;
  }

  // Delete
  static void deleteNoteFromDB(NotesModel note) async {
    await _database.rawQuery('DELETE FROM $tableName WHERE $id = ${note.id} ');
    //   “Delete the row in the table $tableName where the column $id matches the value note.id
  }

  // Update
  static updateNoteFromDB(NotesModel note) async {
    await _database.rawUpdate(
      "UPDATE $tableName SET $title = '${note.title}' , $content = '${note.content}' , $date = '${note.date}' WHERE $id = ${note.id}",
    );
  //   Find the row in the table where id equals the note’s id, and replace its title, content, and date with the new values
  }




}
