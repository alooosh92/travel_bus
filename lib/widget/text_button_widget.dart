import 'package:flutter/material.dart';
import '../res/text_style_manager.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key, required this.text, required this.function});
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyleManager.defuolt,
      ),
    );
  }
}
