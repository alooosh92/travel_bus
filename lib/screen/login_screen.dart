import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/routes_manager.dart';
import 'package:travel_bus/res/string_manager.dart';
import 'package:travel_bus/screen/person_info_screen.dart';
import '../res/api.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';
import '../widget/l_s_f_screen_widget.dart';
import '../widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              initialData: const [],
              future:
                  Controller.personInfo(FirebaseAuth.instance.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text(StringManager.witting.tr));
                }
                if (snapshot.hasData) {
                  Navigator.of(context)
                      .pushReplacementNamed(AllRoutesManager.homeScreen);
                }
                return const PersonInfoScreen();
              },
            );
          } else {
            return LSFScreenWidget(
              size: size,
              screen: LoginWidget(
                size: size,
              ),
            );
          }
        },
      ),
    );
  }
}
