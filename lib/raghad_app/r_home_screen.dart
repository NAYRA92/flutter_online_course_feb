import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/raghad_app/r_products_details_page.dart';

import '../constants.dart';

class RHomeScreen extends StatefulWidget {
  const RHomeScreen({super.key});

  @override
  State<RHomeScreen> createState() => _RHomeScreenState();
}

class _RHomeScreenState extends State<RHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          //to make anything scrollable!..
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "images/r_color_logo.png",
                  height: 30.8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: myGreyColor,
                    ),
                    Text(
                      "Aden, Yemen",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: myGreyColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xffF2F3F2),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search Store"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 368,
                  height: 115,
                  child: CarouselView(itemExtent: 300, children: [
                    myCaroselImage("images/fruit_1.jpeg"),
                    myCaroselImage("images/fruit_2.jpg"),
                    myCaroselImage("images/veg_1.jpeg"),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff181725)),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: myGreenColor),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: StreamBuilder(
                    stream: FirebaseFirestore
                    .instance
                    .collection("gerocery").snapshots(), 
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                      final _gerocerySnapshot = snapshot.data?.docs;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _gerocerySnapshot?.length,
                        itemBuilder: (context, index) {
                          return myListViewContainer(
                            _gerocerySnapshot?[index]["img"], 
                            _gerocerySnapshot?[index]["name"], 
                            _gerocerySnapshot?[index]["category"], 
                            _gerocerySnapshot?[index]["price"], 
                            (){});
                        },

                      );

                    })
                  ),

                //best selling part
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Fruit",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff181725)),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: myGreenColor),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // myListViewContainer("images/apple.png", "Red Apple",
                      //     "1kg, Priceg", 4, () {}),
                      // myListViewContainer("images/banana.png",
                      //     "Organic Bananas", "7pcs, Priceg", 3, () {}),
                      // myListViewContainer("images/apple.png", "Red Apple",
                      //     "1kg, Priceg", 4, () {}),
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
