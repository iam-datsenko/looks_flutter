import 'package:flutter/material.dart';

OutlinedButton getButton(Color? textColor, String label, Color? backgroundColor,
    double width, onPress, Color? overlayColor) {
  return OutlinedButton(
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(overlayColor),
        maximumSize: MaterialStatePropertyAll(Size(width, 56)),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        side: const MaterialStatePropertyAll(
            BorderSide(width: 1, color: Colors.white)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
      ),
      onPressed: onPress,
      child: Center(
          child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontFamily: 'Alice',
          fontWeight: FontWeight.w400,
        ),
      )));
}
