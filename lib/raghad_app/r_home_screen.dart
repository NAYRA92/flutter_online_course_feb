import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/raghad_app/r_products_details_page.dart';

import '../constants.dart';

class RHomeScreen extends StatefulWidget {
  const RHomeScreen({super.key});

  @override
  State<RHomeScreen> createState() => _RHomeScreenState();
}
  int _currentIndex = 0;
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
                        stream: FirebaseFirestore.instance
                            .collection("gerocery")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (context)=>
                                    RProductsDetailsPage(
                                      product_image: _gerocerySnapshot?[index]["img"], 
                                      product_name: _gerocerySnapshot?[index]["name"], 
                                      product_detail: _gerocerySnapshot?[index]["category"], 
                                      product_price: _gerocerySnapshot![index]["price"].toString())
                                    ));
                                  });
                            },
                          );
                        })),

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
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("gerocery")
                            .where("category", isEqualTo: "Fruit")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  () {});
                            },
                          );
                        })),

                  //Diary filter
                   SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Diary",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff181725)),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: myGreenColor),
                      ),
                    )
                  ],
                ),
                  Container(
                    height: 250,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("gerocery")
                            .where("category", isEqualTo: "Diary")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  () {});
                            },
                          );
                        })),
              ],
            ),
          ),
        ),
      ),

      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
          _currentIndex = value;
          });
        },
        unselectedItemColor: myGreenColor,
        unselectedLabelStyle: TextStyle(
          color: myGreenColor
        ),
        selectedItemColor: myGreyColor,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.store,), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ] ),
    );
  }
}
