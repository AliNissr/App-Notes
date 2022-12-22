import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/notes_view.dart';

import 'constants.dart';
import 'model/notes_model.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  // Hive هذا الرجستر حتى تسمح لي بضافة البيانات الى
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Poppins',
            brightness: Brightness.dark,
            //scaffoldBackgroundColor: Colors.blue, تقوم بتغير لون الاسكافورد
            //appBarTheme: AppBarTheme(backgroundColor: Colors.lightGreenAccent تقوم بتغير لون ال AppBar
          ),
          home: const NotesView()
      ),
    );
  }
}
