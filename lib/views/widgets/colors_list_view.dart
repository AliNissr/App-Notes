import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_notes/add_note_cubit.dart';

import '../../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}

class ListViewColor extends StatefulWidget {
  const ListViewColor({Key? key}) : super(key: key);

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        itemCount: kColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kColor[index];
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
