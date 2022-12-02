import 'package:flutter/material.dart';
import './colors.dart';

TextButton froyoFlatBtn(String text, onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text),
    style: TextButton.styleFrom(
      foregroundColor: white,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  
  );
}

OutlinedButton froyoOutlineBtn(String text, onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(text),
    style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
    // highlightedBorderColor: highlightColor,
    side: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    ),

  );
}
