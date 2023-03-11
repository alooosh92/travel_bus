import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/text_style_manager.dart';
import '../res/routes_manager.dart';
import '../res/size_manager.dart';
import '../res/string_manager.dart';
import 'elevate_button_widget.dart';
import 'input_text_form_widget.dart';
import 'text_button_widget.dart';
import 'text_label_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.size,
  });
  final DeviesSize size;
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController paswword = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 14),
        TextLabelWidget(
          text: StringManager.wellcomeback.tr,
          textStyle: TextStyleManager.wellcomLogin,
        ),
        TextLabelWidget(
          text: StringManager.signInToContinue.tr,
          textStyle: TextStyleManager.loginToContune,
        ),
        SizedBox(height: size.height / 14),
        InputTextFormWidget(
            textInputType: TextInputType.emailAddress,
            isPass: false,
            label: StringManager.emailAddress.tr,
            textEditingController: username),
        const SizedBox(height: 10),
        InputTextFormWidget(
            textInputType: TextInputType.visiblePassword,
            isPass: true,
            label: StringManager.password.tr,
            textEditingController: paswword),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButtonWidget(
              function: () {
                Navigator.of(context)
                    .pushReplacementNamed(AllRoutesManager.forgotpassword);
              },
              text: StringManager.forgotpassword.tr,
            ),
          ],
        ),
        SizedBox(height: size.height / 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidget(
              function: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: username.text, password: paswword.text);
                } catch (e) {
                  rethrow;
                }
              },
              text: StringManager.login.tr,
            ),
          ],
        ),
        SizedBox(height: size.height / 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabelWidget(
                text: StringManager.donotHaveAnAcount.tr,
                textStyle: TextStyleManager.defuolt),
            TextButtonWidget(
              function: () {
                Navigator.of(context)
                    .pushReplacementNamed(AllRoutesManager.singupScreen);
              },
              text: StringManager.signUpItIsFree.tr,
            ),
          ],
        ),
      ],
    );
  }
}
