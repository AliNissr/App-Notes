import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.hint, this.maxLine = 1, this.onSave, this.validator, this.onChanged})
      : super(key: key);
  final String hint;
  final int maxLine;
  final Function(String?)? onSave;
  final Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSave,
      validator: (value) {
        // معناه اذا القيمة فارغه اطيني ture
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimryColors,
      // maxLength: 10, // اقصى حد للادخال
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
            color: kPrimryColors, fontSize: 18, letterSpacing: 1),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimryColors),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white)
    );
  }
}
