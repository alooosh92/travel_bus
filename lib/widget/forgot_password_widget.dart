import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/routes_manager.dart';
import '../res/size_manager.dart';
import '../res/string_manager.dart';
import '../res/text_style_manager.dart';
import 'elevate_button_widget.dart';
import 'input_text_form_widget.dart';
import 'text_button_widget.dart';
import 'text_label_widget.dart';

class ForgotPasswordWiget extends StatelessWidget {
  const ForgotPasswordWiget({
    super.key,
    required this.size,
  });
  final DeviesSize size;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 14),
        TextLabelWidget(
          text: StringManager.passwordRecovert.tr,
          textStyle: TextStyleManager.wellcomLogin,
        ),
        SizedBox(height: size.height / 14),
        InputTextFormWidget(
            textInputType: TextInputType.emailAddress,
            isPass: false,
            label: StringManager.emailAddress.tr,
            textEditingController: email),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButtonWidget(
              function: () {
                Navigator.of(context)
                    .pushReplacementNamed(AllRoutesManager.loginScreen);
              },
              text: StringManager.login.tr,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(height: size.height / 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidget(
              function: () {},
              text: StringManager.sendCode.tr,
            ),
          ],
        ),
        SizedBox(height: size.height / 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabelWidget(
                text: StringManager.notReceiveTheCode.tr,
                textStyle: TextStyleManager.defuolt),
            TextButtonWidget(
              function: () {},
              text: StringManager.resend.tr,
            ),
          ],
        ),
      ],
    );
  }
}
