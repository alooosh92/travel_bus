import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/string_manager.dart';
import 'package:travel_bus/res/text_style_manager.dart';
import '../res/color_manager.dart';
import '../res/routes_manager.dart';
import 'elevate_button_widget.dart';
import 'input_text_form_widget.dart';
import 'navigation_bar.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defulteAppBar(
          context: context,
          function: () {},
          icon: Icons.settings,
          title: StringManager.setting.tr),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ChangePassword();
                    },
                  );
                },
                icon: const Icon(Icons.password),
                label: Text(
                  StringManager.changePassword.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
              const DDivider(),
              TextButton.icon(
                onPressed: () {
                  Get.locale == const Locale('en')
                      ? Get.updateLocale(const Locale('ar'))
                      : Get.updateLocale(const Locale('en'));
                },
                icon: const Icon(Icons.language),
                label: Text(
                  StringManager.changeLang.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
              const DDivider(),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        text: StringManager.termsOfUseBody.tr,
                        title: StringManager.termsOfUse.tr,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.note),
                label: Text(
                  StringManager.termsOfUse.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
              const DDivider(),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        title: StringManager.programOverview.tr,
                        text: StringManager.programOverviewBody.tr,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.label),
                label: Text(
                  StringManager.programOverview.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
              const DDivider(),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        title: StringManager.connectWithUs.tr,
                        text: StringManager.connectWithUsBody.tr,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.phone),
                label: Text(
                  StringManager.connectWithUs.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
              const DDivider(),
              TextButton.icon(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(AllRoutesManager.loginScreen);
                },
                icon: const Icon(Icons.logout),
                label: Text(
                  StringManager.logout.tr,
                  style: TextStyleManager.defuolt,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DDivider extends StatelessWidget {
  const DDivider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: const Divider(
        color: ColorManager.primaryColor,
        indent: 40,
        endIndent: 40,
        thickness: 1,
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController newPassword = TextEditingController();
    TextEditingController conformPassword = TextEditingController();
    return AlertDialog(
      title: Text(
        StringManager.bookingConfirmation.tr,
        style: TextStyleManager.title,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InputTextFormWidget(
              textInputType: TextInputType.visiblePassword,
              isPass: true,
              label: StringManager.password.tr,
              textEditingController: newPassword,
            ),
            InputTextFormWidget(
              textInputType: TextInputType.visiblePassword,
              isPass: true,
              label: StringManager.passwordConfirmation.tr,
              textEditingController: conformPassword,
            ),
            ElevatedButtonWidget(
                function: () async {
                  if (newPassword.text == conformPassword.text) {
                    FirebaseAuth.instance.currentUser!
                        .updatePassword(newPassword.text);
                    Navigator.of(context).pop();
                  }
                },
                text: StringManager.confirmation.tr)
          ],
        ),
      ),
      contentPadding: const EdgeInsets.all(20),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({
    super.key,
    required this.title,
    required this.text,
  });
  final String text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        title,
        style: TextStyleManager.title,
      ),
      content: Column(
        children: [
          Text(
            text,
            style: TextStyleManager.defuolt,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(StringManager.agree.tr))
        ],
      ),
    );
  }
}
