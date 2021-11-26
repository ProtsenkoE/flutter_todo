import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastMessages {
  static error(String text, context) {
    showToast(
      text,
      context: context,
      duration: const Duration(seconds: 3),
      animDuration: const Duration(microseconds: 1000),
      position: const StyledToastPosition(align: Alignment.topCenter),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
  }

  static success(String text, context) {
    showToast(
      text,
      context: context,
      duration: const Duration(seconds: 3),
      animDuration: const Duration(microseconds: 1000),
      position: const StyledToastPosition(align: Alignment.topCenter),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
    );
  }
}
