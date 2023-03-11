import 'package:get/get.dart';
import 'color_manager.dart';
import 'package:flutter/material.dart';
import 'string_manager.dart';

class AllThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor: ColorManager.primaryColor,
    hintColor: ColorManager.grayColor,
    shadowColor: ColorManager.grayColor,
    dividerColor: ColorManager.blackColor,
    fontFamily: StringManager.font.tr,
  );
}
