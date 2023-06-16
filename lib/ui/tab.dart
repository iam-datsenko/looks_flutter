import 'package:flutter/material.dart';

TextButton getTab(Color? textColor, String label, Color borderColor, onPress) {
  return TextButton(
      style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: onPress,
      child: Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: borderColor))),
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
