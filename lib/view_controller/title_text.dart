import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 25,
      ),
    );
  }
}
