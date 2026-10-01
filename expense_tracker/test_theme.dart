import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  var t1 = ThemeData().copyWith(colorScheme: kColorScheme);
  var t2 = ThemeData(colorScheme: kColorScheme);
  print(t1.inputDecorationTheme.focusColor == t2.inputDecorationTheme.focusColor);
}
