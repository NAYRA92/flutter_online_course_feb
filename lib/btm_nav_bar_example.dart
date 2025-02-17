import 'package:flutter/material.dart';



class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int selectedValue = 0;
  String homeText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("STUDY PAGE"),
      ),
      body: Center(
        child: Text(homeText,
        style: TextStyle(
          fontSize: 36
        ),)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
           selectedValue = value;
           if(selectedValue == 0){
            homeText = "Settings";
           }
           else if(selectedValue == 1){
            homeText = "Home";
           }
           else{
            homeText = "Profile";
           }
          });
        },
        currentIndex: selectedValue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]
        ),
    );
  }
}