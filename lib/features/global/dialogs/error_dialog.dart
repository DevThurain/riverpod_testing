import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.title, required this.desc, this.onPressedConfirm});

  final String title;
  final String desc;
  final VoidCallback? onPressedConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      content: Text(desc, textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () {
            if (onPressedConfirm != null) {
              onPressedConfirm!();
            }
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
