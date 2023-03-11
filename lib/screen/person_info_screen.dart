import 'package:flutter/material.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';
import '../widget/l_s_f_screen_widget.dart';
import '../widget/person_info.dart';

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key, this.name, this.mobile, this.datetime});
  final String? name;
  final String? mobile;
  final String? datetime;
  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: LSFScreenWidget(
        size: size,
        screen: PersonInfoWidget(size: size),
      ),
    );
  }
}
