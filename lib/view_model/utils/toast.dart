import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast (String message, {Color color = Colors.purple}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}