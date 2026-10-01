import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final formatter = DateFormat.yMd();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              "Please make sure a valid title, amount, date, category was entered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    // now once we know the data is valid, we can create an expense item out of it and append it to the expenses list and then close the modal
    // and we need to re-build the UI
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    // close the modal
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
            controller: _titleController,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    prefix: Text('₹ '),
                    label: Text("Amount"),
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? 'Selected Date'
                          : formatter.format(_selectedDate!)),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                      // decoration: TextDecoration.underline,
                    ),
                  )),
              const Spacer(),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
