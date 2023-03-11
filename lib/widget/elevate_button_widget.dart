import 'package:flutter/material.dart';
import 'package:travel_bus/res/color_manager.dart';
import 'package:travel_bus/res/text_style_manager.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {super.key, required this.function, required this.text, this.color});
  final String text;
  final Function() function;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color color1 = ColorManager.primaryColor;
    if (color != null) {
      color1 = color!;
    }
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(color1),
      ),
      onPressed: function,
      child: Text(
        text,
        style: TextStyleManager.defuolt,
      ),
    );
  }
}
