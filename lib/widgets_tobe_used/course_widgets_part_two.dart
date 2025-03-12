import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/constants.dart';


class CourseWidgetsPartTwo extends StatefulWidget {
  const CourseWidgetsPartTwo({super.key});

  @override
  State<CourseWidgetsPartTwo> createState() => _CourseWidgetsPartTwoState();
}

class _CourseWidgetsPartTwoState extends State<CourseWidgetsPartTwo> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, //this option to convert content to be from right-to-left
      child: Scaffold(
        backgroundColor: myGreyColor,
        body: Center(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: myGreenColor,
                child: Center(
                  child: Text("NEW FOOD")),
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    _isFavourite == false ? 
                    _isFavourite = true : 
                    _isFavourite = false;
                  });
                  print(_isFavourite);
                }, 
                icon: Icon(
                  _isFavourite == true ?
                  Icons.favorite_border_outlined : Icons.favorite_rounded
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}