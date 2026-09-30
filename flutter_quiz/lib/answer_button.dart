import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const AnswerButton({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        ),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}
