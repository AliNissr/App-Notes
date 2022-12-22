import 'package:flutter/material.dart';

import 'package:notesapp/views/widgets/add_note_modal_bottom_sheer.dart';
import 'package:notesapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ملاحضة هذه ال BlocProvider اكدر اخليه في main لان NotesView هي مفتوحه هذا الواجه ونحتاجه دائما لذالك اخليه هنا او في المين ميفرق مو مثل ال AddNotesCubit احتاجه فقط في AddNoteModalBottomSheer
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //هنا تكملة الخطوة الثانية ... هذا حتى من افتح ال كيبورد تسمح بعمل سكرول ... اعطي لل isScrollControlled قيمة ب true حتى تسمح لل showModalBottomSheet بالارتفاع وفسح المجال للكيبورد
            isScrollControlled: true,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return AddNoteModalBottomSheer();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}

