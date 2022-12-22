import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_notes/add_note_cubit.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteModalBottomSheer extends StatelessWidget {
  const AddNoteModalBottomSheer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {

          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          // خذه الوجد تعمل على اذا كان الخاصية لي عدة هي absorbing ب true راح تمنعني من قيام بالتغير في chile مالته يعني حسب المثلا بعد ما اكدر اغير بالتكس لي عدي
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  // الخطوات لجعل الكيبورد عند اضافة ملاحض يوم بعمل سكرول لل شاشه ويشهر زر البتن والكيبورد تحته
                  //  1- اول حتى اقوم بتحكم في جعل مسافه للكيبور اقوم بعمل MediaQuery هذا تجعلني اتحكم في اجزاء ال device's ومن ضمنها ال الكيبورد اما ال viewInsets فيه تخص بيانات الكيبورد
                  // اذهب الى ال notes_view_dart هناك تجد الخطوة الثانية
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
