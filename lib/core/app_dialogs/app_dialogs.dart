import 'package:flutter/material.dart';

class AppDialogs {
  static void showMessage(BuildContext context,
      {required String title, MessageType type = MessageType.success}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == MessageType.success ? Colors.green : Colors.red,
    ));
  }
}

enum MessageType { success, error }
