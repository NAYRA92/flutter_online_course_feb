import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/constants.dart';

class SHomeScreen extends StatefulWidget {
  const SHomeScreen({super.key});

  @override
  State<SHomeScreen> createState() => _SHomeScreenState();
}

class _SHomeScreenState extends State<SHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, //right-to-left
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: s_greenColor,
          title: Image.asset("images/shatha_logo.png"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.translate_outlined,
                  color: s_softColor,
                ))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "آخر المقالات",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  child: CarouselView(itemExtent: 300, children: [
                    myCaroselImage("images/env_1.png"),
                    myCaroselImage("images/env_2.png"),
                    myCaroselImage("images/env_1.png"),
                    myCaroselImage("images/env_2.png"),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "طرق للحفاظ على البيئة",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 500,
                  padding: EdgeInsets.all(30),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      envGridViewContainer(
                          "images/c_1.png", "قلل من استخدام البلاستيك", () {}),
                      envGridViewContainer(
                          "images/c_2.png", "أزرع شجرة", () {}),
                      envGridViewContainer("images/c_3.png",
                          "استخدم منتجات صديقة للبيئة", () {}),
                      envGridViewContainer("images/c_4.png",
                          "قلل، استخدمها مرة اخرى، وأعد التدوير", () {})
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
