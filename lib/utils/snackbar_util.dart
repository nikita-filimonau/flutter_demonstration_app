import 'package:flutter/material.dart';

class SnackBarUtil extends ChangeNotifier {
  late GlobalKey<ScaffoldMessengerState> snackBarKey;

  static SnackBarUtil instance = SnackBarUtil();

  SnackBarUtil() {
    snackBarKey = GlobalKey<ScaffoldMessengerState>();
  }

  void showSnackBar(String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    snackBarKey.currentState?.showSnackBar(snackBar);
  }
}
