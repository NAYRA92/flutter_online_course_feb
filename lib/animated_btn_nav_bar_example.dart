import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/constants.dart';


class AnimatedBtnNavBarExample extends StatefulWidget {
  const AnimatedBtnNavBarExample({super.key});

  @override
  State<AnimatedBtnNavBarExample> createState() => _AnimatedBtnNavBarExampleState();
}

class _AnimatedBtnNavBarExampleState extends State<AnimatedBtnNavBarExample> {
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.settings,
    Icons.newspaper,
    Icons.home,
    Icons.favorite
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: myGreenColor
        ),
        onPressed: (){},
        icon: Icon(
          Icons.add, 
          color: Colors.white,),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: _bottomNavIndex,
      activeColor: myGreenColor,
      inactiveColor: myGreyColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      //other params
   ),
    );
  }
}