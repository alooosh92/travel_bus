import 'package:flutter/material.dart';
import 'package:travel_bus/res/color_manager.dart';
import 'package:travel_bus/widget/home_widget.dart';
import 'package:travel_bus/widget/setting_widget.dart';
import 'package:travel_bus/widget/ticket_widget.dart';
import '../widget/navigation_bar.dart';
import '../widget/person_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PageController pageController = PageController(
  initialPage: 0,
  viewportFraction: 1,
);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        // floatingActionButton: defulteFloatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const DefulteAnimatedBottomNavigationBar(),
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          allowImplicitScrolling: false,
          itemCount: pageList.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return pageList[index];
          },
        ),
      ),
    );
  }
}

List<Widget> pageList = [
  const PersonWidget(),
  const HomeWidget(),
  const TicketWidget(),
  const SettingWidget(),
];
