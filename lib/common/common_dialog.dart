import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErroMessage(context, String text) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: const Text(
              "Алдаа",
              style: TextStyle(fontSize: 14),
            ),
            content: Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<void> showWarningMessage(context, String title, String content) async {
  await showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<void> showInfoMessage(context, String title, String content) async {
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<bool> showConfirmationMessage(context, String title, String content,
    [String? labelFalse, String? labelTrue, int? distructiveIndex]) async {
  bool isConfirmed = false;
  await showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 0,
                child: Text(labelFalse ?? "いいえ"),
                onPressed: () {
                  isConfirmed = false;
                  Navigator.pop(context, false);
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 1,
                child: Text(labelTrue ?? "はい"),
                onPressed: () {
                  isConfirmed = true;
                  Navigator.pop(context, true);
                },
              ),
            ],
          ));
  return isConfirmed;
}
