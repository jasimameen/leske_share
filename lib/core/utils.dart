import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension SizedBoxPlaceHolder on num {
  // sized box with [height] as given number
  SizedBox get hSizedBox => SizedBox(height: toDouble());

  // sized box with [width] as given number
  SizedBox get wSizedBox => SizedBox(width: toDouble());

  // duration with [milliseconds] as given number
  Duration get toMilliSeconds => Duration(milliseconds: toInt());

  // duration with [seconds] as given number
  Duration get toSeconds => Duration(seconds: toInt());
}

extension ContextExtension on BuildContext {
  /// closes current snackbar
  void closeSnackBar() => ScaffoldMessenger.of(this).removeCurrentSnackBar();

  /// shows a snackbar with message in the screen
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      elevation: 10,
      duration: 250.toMilliSeconds,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
      action: SnackBarAction(label: 'close', onPressed: closeSnackBar),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );

    closeSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  // navigation
  void go(Widget page) => Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  // pop
  void pop() => Navigator.pop(this);
}
