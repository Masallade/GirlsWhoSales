import 'package:flutter/material.dart';

Color myfieldColor  = Colors.blueGrey[300];
double borderRadious  = 5.0;



InputDecoration getInputDecoration(
    {String hint,bool darkMode,Color errorColor}) {
  return InputDecoration(
    // filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
    fillColor: Colors.black,
    hintText: hint.toUpperCase(),
    hintStyle: const TextStyle(
      color: Colors.black38,
      fontSize: 13,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadious),
        borderSide: BorderSide(color: myfieldColor, width: 2.0)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(borderRadious),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(borderRadious),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadious),
      borderSide: BorderSide(color: myfieldColor),
    ),
  );
}