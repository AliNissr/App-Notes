import 'package:flutter/material.dart';
import 'package:notesapp/model/notes_model.dart';
import 'package:notesapp/views/widgets/edit_note_view_body.dart';
class EditNoteVire extends StatelessWidget {
  const EditNoteVire({Key? key, required this.note}) : super(key: key);
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return EditNoteViewBody(note:note);
  }
}
