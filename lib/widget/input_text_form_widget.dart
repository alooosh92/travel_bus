import 'package:flutter/material.dart';
import '../res/text_style_manager.dart';

class InputTextFormWidget extends StatelessWidget {
  const InputTextFormWidget({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.isPass,
    required this.textInputType,
  });
  final String label;
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: isPass,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyleManager.defuolt,
      ),
    );
  }
}
