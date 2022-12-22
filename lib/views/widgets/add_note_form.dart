import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/add_notes/add_note_cubit.dart';
import 'package:notesapp/model/notes_model.dart';

import 'colors_list_view.dart';
import 'custom_text_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();

  // هذا الطريقة تستخدم لغرض في حال دخل input خطاء راح يعترض عليه ويخليه يصحح الخطاء
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              onSave: (value) {
                title = value;
              },
              hint: 'Title'),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            onSave: (value) {
              subtitle = value;
            },
            hint: 'Content',
            maxLine: 8,
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 38*2,
              child: ListViewColor()),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomTextButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      // حتى اعمل فورمات لل وقت استخدم packages intl في pubspec.yaml .. ثم عمل متغير currentDate يحتوي الوقت الحالي . ثم اقوم بعمل متغير formattedCurrentDate يسوي format للمتغير ال CurrentDate
                      DateTime currentDate = DateTime.now();
                      var formattedCurrentDate =
                          DateFormat('yyyy_MM_dd / hh:mm').format(currentDate);
                      var noteModal = NoteModel(
                          title: title!,
                          subTitle: subtitle!,
                          data: formattedCurrentDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModal);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
