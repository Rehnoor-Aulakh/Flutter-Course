import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// for global variables, it is a convention to start with k
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     // once the orientation has been locked in, then start the app
  //     .then((fn) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.inversePrimary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kDarkColorScheme.onSecondaryContainer),
          bodyMedium: const TextStyle()
              .copyWith(color: kDarkColorScheme.onSecondaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
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
      // themeMode: ThemeMode.system, this is actually the default themeMode
      home: const Expenses(),
    ),
  );
  // });
}
