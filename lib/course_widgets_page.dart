import 'package:flutter/material.dart';


class CourseWidgetsPage extends StatefulWidget {
  const CourseWidgetsPage({super.key});

  @override
  State<CourseWidgetsPage> createState() => _CourseWidgetsPageState();
}

class _CourseWidgetsPageState extends State<CourseWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مرحباً",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  child: ListView(
                    children: [
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                      Text("العنصر رقم 1", style: TextStyle(
                        fontSize: 48,
                        color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.print),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]),
    );
  }
}