import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';
import 'package:notesapp/views/widgets/custom_app_bar.dart';
import 'package:notesapp/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}
class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  //  هنا قمت بستدعاء هذا الفكشن اول ما يشتغل الطبيق يجيب البيانات فراح اكون متاكد انو notes المجود في notes_list_view.dart هي ليست null الي مستدعية من NotesCubit
  void initState() {
   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Notes' , icon: Icons.search),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: NotesListView(),
          ),)
        ],
      ),
    );
  }
}
