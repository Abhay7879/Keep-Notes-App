import 'package:flutter/material.dart';
import 'package:keep_notes/EditNoteView.dart';
import 'package:keep_notes/colors.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String note =
      "This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note This is a note";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () {},
            icon: Icon(
              Icons.push_pin_outlined,
            ),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () {},
            icon: Icon(
              Icons.archive_outlined,
            ),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditNoteView()));
            },
            icon: Icon(
              Icons.edit_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Heading",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              note,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
