import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/color_manager.dart';
import 'package:travel_bus/res/size_manager.dart';
import 'package:travel_bus/res/string_manager.dart';
import '../res/page_splash.dart';
import '../res/text_style_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    PageController pageController =
        PageController(initialPage: 0, viewportFraction: 1);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pageSplash.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    pageSplash[index].title,
                    style: TextStyleManager.title,
                  ),
                  Text(
                    pageSplash[index].body,
                    style: TextStyleManager.messageText,
                  ),
                  Image.asset(
                    pageSplash[index].image,
                    height: size.imagesHeight,
                    width: size.imagesWidth,
                  ),
                ],
              );
            },
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(StringManager.skip.tr),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 50,
                    color: ColorManager.primaryColor,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
