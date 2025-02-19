import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/raghad_app/r_home_screen.dart';

import '../constants.dart';


class ROnboardingScreen extends StatefulWidget {
  const ROnboardingScreen({super.key});

  @override
  State<ROnboardingScreen> createState() => _ROnboardingScreenState();
}

class _ROnboardingScreenState extends State<ROnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/r_man_bg.png"),
            fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("images/r_logo_solo.png"),
              Text("Welcome\nto our store",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w600
              ),),
              Text("Ger your groceries in as fast as one hour",  //\n to have another line below
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 353,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myGreenColor
                  ),
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => RHomeScreen()));
                  }, 
                  child: Text("Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),)),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}