import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesW extends StatefulWidget {
  @override
  _NotesWState createState() => _NotesWState();
}

class _NotesWState extends State<NotesW> {
  List<Note> notes = [];
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSavedNotes();
  }

  Future<void> loadSavedNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = (prefs.getStringList('notes') ?? [])
          .map((note) => Note(note))
          .toList();
    });
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes.map((note) => note.text).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF0000),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    notes[index].text,
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 20.0,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                      hintText: 'Add a note...',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      notes.add(Note(noteController.text));
                      noteController.clear();
                      saveNotes();
                    });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xFFFF0000),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  String text;

  Note(this.text);
}

void main() {
  runApp(MaterialApp(
    home: NotesW(),
  ));
}
