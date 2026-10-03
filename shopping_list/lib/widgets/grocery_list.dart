import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

// TODO: Add the features of showing fallback message when there is no item, and also slide to remove the item

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) return;
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text(
                "No items added yet.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItems[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                ),
                onDismissed: (direction) {
                  // remove the _groceryItems[index] from the List
                  setState(() {
                    _groceryItems.remove(_groceryItems[index]);
                  });
                },
                child: ListTile(
                  title: Text(_groceryItems[index].name),
                  leading: Container(
                      width: 24,
                      height: 24,
                      color: _groceryItems[index].category.color),
                  trailing: Text(_groceryItems[index].quantity.toString()),
                ),
              ),
            ),
    );
  }
}
