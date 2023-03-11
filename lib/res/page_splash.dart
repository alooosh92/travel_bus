import 'package:flutter/material.dart';
import 'package:travel_bus/res/images_manager.dart';
import 'package:travel_bus/res/string_manager.dart';
import 'size_manager.dart';
import 'text_style_manager.dart';

class PageSplash extends StatelessWidget {
  final String title;
  final String body;
  final String image;
  const PageSplash({
    required this.title,
    required this.body,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DeviesSize size = DeviesSize.size(context);
    return Column(
      children: [
        Text(
          title,
          style: TextStyleManager.title,
        ),
        Text(
          body,
          style: TextStyleManager.messageText,
        ),
        Image.asset(
          image,
          height: size.imagesHeight,
          width: size.imagesWidth,
        ),
      ],
    );
  }
}

class SplashList {
  final String title;
  final String body;
  final String image;
  SplashList({
    required this.title,
    required this.body,
    required this.image,
  });
}

List<SplashList> pageSplash = [
  SplashList(
    title: StringManager.splashpagetitle1,
    body: StringManager.splashpagebody1,
    image: ImagesManager.spalshImage1,
  ),
  SplashList(
    title: StringManager.splashpagetitle2,
    body: StringManager.splashpagebody2,
    image: ImagesManager.spalshImage2,
  ),
  SplashList(
    title: StringManager.splashpagetitle3,
    body: StringManager.splashpagebody3,
    image: ImagesManager.spalshImage3,
  ),
];
