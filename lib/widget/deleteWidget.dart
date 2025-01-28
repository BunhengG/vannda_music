import 'package:flutter/material.dart';

import '../constant/theme_builder.dart';

class DeleteNoteDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteNoteDialog({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: const Text(
        'Delete Note?',
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onDelete();
            Navigator.pop(context);
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
