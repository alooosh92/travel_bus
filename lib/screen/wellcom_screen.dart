import 'package:flutter/material.dart';
import 'package:travel_bus/res/images_manager.dart';
import 'package:travel_bus/res/size_manager.dart';

class WellcomScreen extends StatelessWidget {
  const WellcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            ImagesManager.icon,
            width: size.iconSize,
            height: size.iconSize,
          ),
        ),
      ),
    );
  }
}
