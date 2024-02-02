import 'package:flutter/material.dart';

void openBottomSheet (BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    barrierColor: Colors.red.withOpacity(0.1),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      );
    },
  );
}