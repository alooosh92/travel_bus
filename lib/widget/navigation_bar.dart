import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../res/color_manager.dart';
import '../res/text_style_manager.dart';
import '../screen/home_screen.dart';

AppBar defulteAppBar({
  required String title,
  required BuildContext context,
  required IconData icon,
  required Function() function,
}) {
  return AppBar(
    centerTitle: true,
    actions: [
      TextButton.icon(
        onPressed: function,
        icon: Icon(
          icon,
          color: ColorManager.whiteColor,
        ),
        label: const Text(''),
      )
    ],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    titleTextStyle: TextStyleManager.appBarTitle,
    backgroundColor: ColorManager.primaryColor,
    title: SizedBox(
      height: 50,
      child: Text(
        title,
      ),
    ),
  );
}

AppBar defulteAppBarHome({
  required String title,
  required BuildContext context,
  required IconData icon,
  required Function() function,
}) {
  return AppBar(
    centerTitle: true,
    actions: [
      TextButton.icon(
        onPressed: function,
        icon: Icon(
          icon,
          color: ColorManager.whiteColor,
        ),
        label: const Text(''),
      )
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.elliptical(MediaQuery.of(context).size.width, 30),
      ),
    ),
    titleTextStyle: TextStyleManager.appBarTitle,
    backgroundColor: ColorManager.primaryColor,
    title: SizedBox(
      height: 50,
      child: Text(
        title,
      ),
    ),
  );
}

AnimatedBottomNavigationBar defulteAnimatedBottomNavigationBar(
    int page, Function(int i) fun) {
  return AnimatedBottomNavigationBar(
      activeColor: ColorManager.primaryColor,
      iconSize: 25,
      rightCornerRadius: 25,
      leftCornerRadius: 25,
      splashColor: ColorManager.primaryColor,
      splashSpeedInMilliseconds: 500,
      icons: const [
        Icons.person_outline,
        Icons.home_outlined,
        Icons.search_outlined,
        Icons.airplane_ticket_outlined
      ],
      activeIndex: page,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: fun);
}

// FloatingActionButton defulteFloatingActionButton(BuildContext context) {
//   return FloatingActionButton(
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return const AlertDialog(
//             title: Text('معلومات الرحلة'),
//             content: FindTicketWidget(),
//             contentPadding: EdgeInsets.all(10),
//           );
//         },
//       );
//     },
//     child: const Icon(Icons.add),
//   );
// }

class DefulteAnimatedBottomNavigationBar extends StatefulWidget {
  const DefulteAnimatedBottomNavigationBar({super.key});

  @override
  State<DefulteAnimatedBottomNavigationBar> createState() =>
      _DefulteAnimatedBottomNavigationBarState();
}

int pageBar = 0;

class _DefulteAnimatedBottomNavigationBarState
    extends State<DefulteAnimatedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: ColorManager.primaryColor,
      activeColor: Colors.black,
      inactiveColor: ColorManager.whiteColor,
      iconSize: 25,
      rightCornerRadius: 25,
      leftCornerRadius: 25,
      splashColor: ColorManager.whiteColor,
      splashSpeedInMilliseconds: 500,
      icons: const [
        Icons.person_outline,
        Icons.home_outlined,
        Icons.airplane_ticket_outlined,
        Icons.settings_outlined,
      ],
      activeIndex: pageBar,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (i) => setState(() {
        pageBar = i;
        pageController.jumpToPage(i);
      }),
    );
  }
}
