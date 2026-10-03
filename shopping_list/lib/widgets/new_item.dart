import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  // this is to make sure that if the widget rebuilds, then the form does not lose its state.

  void _saveItem() {
    // trigger validation
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (strValue) {
                  if (strValue == null ||
                      strValue.isEmpty ||
                      strValue.trim().length <= 1 ||
                      strValue.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
              ), // instead of TextField
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      validator: (strValue) {
                        if (strValue == null ||
                            strValue.isEmpty ||
                            int.tryParse(strValue) == null ||
                            int.tryParse(strValue)! <= 0 ||
                            strValue.trim().length > 50) {
                          return 'Must be a valid positive number.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                    width: 24,
                                    height: 24,
                                    color: category.value.color),
                                const SizedBox(width: 10),
                                Text(category.value.title),
                              ],
                            ))
                    ], onChanged: (val) {}),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset')),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text('Add Item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
