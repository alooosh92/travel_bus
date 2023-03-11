import 'package:flutter/material.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';

class LSFScreenWidget extends StatelessWidget {
  const LSFScreenWidget({
    super.key,
    required this.size,
    required this.screen,
  });
  final DeviesSize size;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.whiteColor,
              ),
              height: size.loginInScreenHeight,
              width: size.loginInScreenWidth,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: screen,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
