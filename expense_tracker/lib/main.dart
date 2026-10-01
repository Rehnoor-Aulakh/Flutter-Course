import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// for global variables, it is a convention to start with k
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 220, 189, 252),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.inversePrimary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kColorScheme.onSecondaryContainer),
          bodyMedium: const TextStyle()
              .copyWith(color: kColorScheme.onSecondaryContainer),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
