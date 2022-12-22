import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../model/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() async {
    // حتى اضيف في ال بوس لي سويناه اقوم بالخطوات التالية
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    // هنا حتى اجيب اليانات لي دخلتة من خلال Add Cubit
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
