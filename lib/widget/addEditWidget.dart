import 'package:flutter/material.dart';

import '../constant/theme_builder.dart';

class AddEditNoteDialog extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String actionText;
  final VoidCallback onAction;

  const AddEditNoteDialog({
    super.key,
    required this.controller,
    required this.title,
    required this.actionText,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70),
      ),
      content: TextField(
        style: const TextStyle(color: Colors.white70),
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter your note',
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
      actions: [
        //* save button
        TextButton(
          onPressed: () {
            onAction();
            Navigator.pop(context);
          },
          child: Text(
            actionText,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        //* Cancel button
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
