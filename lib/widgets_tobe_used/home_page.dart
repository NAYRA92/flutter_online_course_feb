import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Icon(
          Icons.wallet,
          color: const Color.fromARGB(201, 164, 26, 228),
        )
      ),
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
                image: NetworkImage("https://storage.googleapis.com/cms-storage-bucket/3461c6a5b33c339001c5.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                opacity: .6
                )
            ),
           ),
           SizedBox(
            height: 15,
          ),
           Text("Flutter Community Event")
         ],
       ),
     ),
    );
  }
}