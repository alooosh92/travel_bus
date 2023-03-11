import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_bus/screen/person_info_screen.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';
import '../widget/l_s_f_screen_widget.dart';
import '../widget/signup_widget.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const PersonInfoScreen();
          } else {
            return LSFScreenWidget(
              size: size,
              screen: SignupWidget(size: size),
            );
          }
        },
      ),
    );
  }
}
