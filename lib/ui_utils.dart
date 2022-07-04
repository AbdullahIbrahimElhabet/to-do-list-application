import 'package:flutter/material.dart';

void showDialoge(String message, BuildContext context,
    {bool cancelable = false}) {
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        );
      },
      barrierDismissible: cancelable);
}

void hidDailoge(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(String message, BuildContext context, String actionText,
    VoidCallback action,
    [bool isCanclable = false]) {
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
            content: Row(
              children: [
                Expanded(child: Text(message)),
              ],
            ),
            actions: [TextButton(onPressed: action, child: Text(actionText))],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ));
      },
      barrierDismissible: isCanclable);
}
