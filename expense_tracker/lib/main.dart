import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// for global variables, it is a convention to start with k
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme()
              .copyWith(backgroundColor: kColorScheme.onPrimaryContainer)),
      home: const Expenses(),
    ),
  );
}
