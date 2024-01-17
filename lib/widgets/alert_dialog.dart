import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void customAlertDialog(
  BuildContext context, {
  required String content,
  required String positiveButtonText,
  required String negativeButtonText,
  required VoidCallback? negativeButtonPressed,
  required VoidCallback? positiveButtonPressed,
}) {
  Platform.isIOS || Platform.isMacOS
      ? showCupertinoDialog<String>(
          context: context,
          builder: (BuildContext dialogContext) {
            return CupertinoAlertDialog(
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text(negativeButtonText),
                  onPressed: negativeButtonPressed,
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(positiveButtonText),
                  onPressed: positiveButtonPressed,
                  textStyle: TextStyle(color: Colors.green),
                ),
              ],
            );
          },
        )
      : showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              content: Text(
                content,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              backgroundColor: Colors.white,
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        child: Text(negativeButtonText),
                        onPressed: negativeButtonPressed,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: positiveButtonPressed,
                            child: Text(positiveButtonText),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
              actionsAlignment: MainAxisAlignment.center,
              insetPadding: const EdgeInsets.all(20),
              contentPadding: const EdgeInsets.only(top: 28, left: 28, right: 28, bottom: 20),
              contentTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        );
}
