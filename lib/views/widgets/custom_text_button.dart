import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.onPressed, this.isLoading = false})
      : super(key: key);
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimryColors,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton(
            onPressed: onPressed,
            child: isLoading
                ?const SizedBox(
              height: 18,
                width: 18,
                child: CircularProgressIndicator(color: Colors.black,))
                : const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )));
  }
}
