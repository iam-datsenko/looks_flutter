import 'package:flutter/material.dart';

TextButton getButton(Color? textColor, String label, Color? backgroundColor,
    double width, onPress) {
  return TextButton(
      style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: onPress,
      child: Container(
          width: width,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(32)),
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
