import 'package:flutter/material.dart';

class Alert {
  static void showSimpleAlert(
    BuildContext context, {
    String title,
    String message,
    String buttonTitle,
    VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          new TextButton(
            child: new Text(buttonTitle),
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressed != null) onPressed();
            },
          ),
        ],
      ),
    );
  }
}
