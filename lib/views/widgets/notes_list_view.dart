import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';
import 'package:notesapp/model/notes_model.dart';

import 'custom-note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // اقوم بعمل هذه الحركة حتى اتخلص من هذا الخطاء Null check operator used on a null value
        //   notes ?? []...... اطيني لست فارغه حتى ميطلع  هذا الخطاء notes يعني اذا فارغ ال
        List<NoteModel> note = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: note.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding:const EdgeInsets.symmetric(vertical: 5),
              child: NotesItem(
                note: note[index],
              ),
            );
          },
        );
      },
    );
  }
}
