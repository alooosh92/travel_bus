import 'package:flutter/material.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';
import '../widget/forgot_password_widget.dart';
import '../widget/l_s_f_screen_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: LSFScreenWidget(
          size: size,
          screen: ForgotPasswordWiget(
            size: size,
          )),
    );
  }
}
