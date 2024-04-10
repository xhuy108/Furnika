import 'package:flutter/material.dart';

void showSnackbar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
      ),
    );
}
