import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/r_onboarding_screen.dart';


class RSplashScreen extends StatelessWidget {
  const RSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ROnboardingScreen()));
    });
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: Image.asset(
          "images/r_logo.png",
          width: 200,),
          ),
    );
  }
}

//0xff53B175