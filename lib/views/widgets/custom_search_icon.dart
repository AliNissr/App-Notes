import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        // استخدام مع اللون withOpacity راح اتحكم بشفافيت اللون
        //  وتوجد يضان withAlpha تتحكم بشفافية
        color: Colors.white.withOpacity(0.08),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 24,
          )),
    );
  }
}
