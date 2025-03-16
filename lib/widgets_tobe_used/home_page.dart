import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../gemini_ai_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
              child: Lottie.asset('images/girl_study.json'),
              // Text("WELCOME"),
            )
                // Image.asset("images/shatha_logo.png")
                ),
            ListTile(
              title: Text("Settings"),
              subtitle: Text("this is for app settings"),
              trailing: Icon(Icons.send),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("Home Page"),
              subtitle: Text("return to home page"),
              trailing: Icon(Icons.send),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("Share"),
              subtitle: Text("share app on social media"),
              trailing: Icon(Icons.send),
              leading: Icon(Icons.share),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          title: Icon(
            Icons.wallet,
            color: const Color.fromARGB(201, 164, 26, 228),
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://storage.googleapis.com/cms-storage-bucket/3461c6a5b33c339001c5.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      opacity: .6)),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Flutter Community Event"),

          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (BuildContext){
              return AlertDialog(
                title: Center(
                  child: Text("اسألني أي شيء خاص بالبيئة", 
                  style: TextStyle(fontSize: 14),),
                ),
                content: Container(
                  height: 300,
                  child: GeminiAiPage())
              );
            });
        },
        tooltip: "مساعد ذكي",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble),
              // Text("AI Bot")
          ],
        ),),    
    );
  }
}
