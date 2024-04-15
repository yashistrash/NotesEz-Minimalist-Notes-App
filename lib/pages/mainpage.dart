import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/components/drawer.dart';
import 'package:project/components/note_tile.dart';
import 'package:project/models/note.dart';
import 'package:project/models/note_database.dart';
import 'package:provider/provider.dart';
class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {

  final textController= TextEditingController();

  @override
  void initState(){
    super.initState();

    readNotes();
  }
  //createUI
  void createNote(){
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(onPressed: () {
            context.read<NoteDatabase>().addNote(textController.text);
            textController.clear();
            Navigator.pop(context);
          },
          child: const Text("Create"),
          )
        ],
      ),
  );
}

//readUI
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }
//updateUI
  void updateNote(Note note){
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Update Note", style: GoogleFonts.chakraPetch(),),
          content: TextField(controller: textController),
          actions: [
            MaterialButton(onPressed: (){
              context.read<NoteDatabase>().updateNote(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Update", style: GoogleFonts.chakraPetch(),),
            )
          ],
        )
    );
  }

  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {

    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Menu', style: GoogleFonts.chakraPetch())),
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          child: const Icon(Icons.add),
        ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Notes', style: GoogleFonts.chakraPetch(textStyle: const TextStyle(fontSize: 48)),),
          ),
          Expanded(child:
          ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index){
            final note = currentNotes[index];
            return NoteTile(text: note.text,
            onEditPressed: () => updateNote(note),
              onDeletePressed: () => deleteNote(note.id),
            );
              },
              ),
          ),
        ],
      ),
    );
  }
}
