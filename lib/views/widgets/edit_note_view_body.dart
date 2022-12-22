import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/read_notes/notes_cubit.dart';
import 'package:notesapp/model/notes_model.dart';

import '../../constants.dart';
import 'colors_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
                title: 'Edit Notes',
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subtitle ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              onChanged: (value) {
                subtitle = value;
              },
              hint: widget.note.subTitle,
              maxLine: 6,
            ),
            const SizedBox(
              height: 10,
            ),
              EditNoteColorList(
                note: widget.note,
             ),
          ],
        ),
      ),
    );
  }
}


class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({Key? key, required this.note}) : super(key: key);
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex ;
  @override
  void initState() {
    currentIndex = kColor.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColor[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColor[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
