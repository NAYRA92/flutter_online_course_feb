import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:flutter/material.dart';


class WaterDropNavBar_Example extends StatefulWidget {
  const WaterDropNavBar_Example({super.key});

  @override
  State<WaterDropNavBar_Example> createState() => _WaterDropNavBar_ExampleState();
}

class _WaterDropNavBar_ExampleState extends State<WaterDropNavBar_Example> {
  int selectedIndex = 0;
  String homeText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.bookmark_rounded,
            outlinedIcon: Icons.bookmark_border_rounded,
          ),
          BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined),
          BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded),
        ],
      ),
    );
  }
}