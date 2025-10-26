import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/data/models/notes_model.dart';
import 'package:formula1_fantasy/f1/presentation/providers/notes_provider.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/Custom_text_field.dart';
import 'package:provider/provider.dart';

class NotesWidget extends StatelessWidget {
   NotesWidget({super.key, required this.model,this.onDismissed}){
    titleController.text = model.title;
    contentController.text = model.content;
  }
  final NotesModel model;
  final void Function(DismissDirection)? onDismissed;


  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);
    const f1Red = Color(0xFFE10600);
    return Dismissible(
      onDismissed: onDismissed,
      background: Container(
        color: f1Red,
        child: Center(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Dismiss",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),

      key:  UniqueKey(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: f1Red.withOpacity(0.3)),
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 12),
              Text(
                model.content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          trailing: Text(model.date, style: TextStyle(color: Colors.white)),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(color: darkBg),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hint: "Title",
                          controller: titleController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hint: "Content",
                          controller: contentController,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: f1Red,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide.none,
                              ),
                            ),
                            onPressed: ()  {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "TitilliumWeb",
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

TextEditingController titleController = TextEditingController();
TextEditingController contentController = TextEditingController();
