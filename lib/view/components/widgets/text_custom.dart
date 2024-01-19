import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  const TextCustom({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
