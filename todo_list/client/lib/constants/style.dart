import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';  
  
TextStyle tb1Style() => TextStyle(
  fontSize: 24,
  color: cBlue,
  fontWeight: FontWeight.bold,
);

TextStyle tb2Style() => TextStyle(
  fontSize: 18,
  color: cBlack,
  fontWeight: FontWeight.normal,
);

ButtonStyle bgPinkStyle () => ElevatedButton.styleFrom(
  backgroundColor: cPink,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );