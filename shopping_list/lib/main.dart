import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Groceries",
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Your Groceries"),
        ),
        body: ListView(
          children: [
            // need to loop over the groceryItems and Render a row
            for (final groceryItem in groceryItems)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 18,
                ),
                child: Row(
                  children: [
                    // render the square of this color
                    // color can be found in groceryItem.category.color
                    Icon(
                      Icons.square,
                      size: 32,
                      color: groceryItem.category.color,
                    ),
                    const SizedBox(width: 30),
                    Text(groceryItem.name),
                    const Spacer(),
                    Text(groceryItem.quantity.toString()),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
