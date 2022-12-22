import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';
import 'package:notesapp/model/notes_model.dart';

import 'edit_note_view_body.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteViewBody(note: note,);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(note.subTitle,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 18)),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(note.data,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
