import 'package:firebase_auth/firebase_auth.dart';
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

class SignupWidget extends StatelessWidget {
  const SignupWidget({
    super.key,
    required this.size,
  });
  final DeviesSize size;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController repassword = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 14),
        TextLabelWidget(
          text: StringManager.createAccont.tr,
          textStyle: TextStyleManager.wellcomLogin,
        ),
        SizedBox(height: size.height / 14),
        InputTextFormWidget(
          textInputType: TextInputType.emailAddress,
          isPass: false,
          label: StringManager.emailAddress.tr,
          textEditingController: email,
        ),
        const SizedBox(height: 10),
        InputTextFormWidget(
          textInputType: TextInputType.visiblePassword,
          isPass: true,
          label: StringManager.password.tr,
          textEditingController: password,
        ),
        const SizedBox(height: 10),
        InputTextFormWidget(
          textInputType: TextInputType.visiblePassword,
          isPass: true,
          label: StringManager.passwordConfirmation.tr,
          textEditingController: repassword,
        ),
        SizedBox(height: size.height / 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidget(
              function: () async {
                try {
                  if (password.text == repassword.text) {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                  }
                } catch (e) {
                  rethrow;
                }
              },
              text: StringManager.signUp.tr,
            ),
          ],
        ),
        SizedBox(height: size.height / 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabelWidget(
                text: StringManager.iHaveAccont.tr,
                textStyle: TextStyleManager.defuolt),
            TextButtonWidget(
              function: () {
                Navigator.of(context)
                    .pushReplacementNamed(AllRoutesManager.loginScreen);
              },
              text: StringManager.login.tr,
            ),
          ],
        ),
      ],
    );
  }
}
