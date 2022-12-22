
import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xff0077B6) ;
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    // حتى اضيف في ال بوس لي سويناه اقوم بالخطوات التالية
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
     emit( AddNoteFailure(errNote: e.toString()));
    }
  }
}
