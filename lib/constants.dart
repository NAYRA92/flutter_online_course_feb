import 'package:flutter/material.dart';

//raghad colors
Color myGreenColor = Color(0xff53B175);
Color myGreyColor = Color(0xff4C4F4D);

//shatha colors
Color s_greenColor = Color(0xff227C70);
Color s_blueColor = Color(0xff1C315E);
Color s_subColor = Color(0xff88A47C);
Color s_softColor = Color(0xffE6E2C3);

Widget myCaroselImage(
  String imageAssetUrl
){
  return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageAssetUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    );
}

//Recycling Widget
//هذا الكود نستخدمه اكثر من مرة من داخل
//القائمة في صفحة الr_home_screen
//لعرض الفواكة مع الاسم والتفاصيل والسعر
Widget myListViewContainer(
  String imageUrl,
  String foodName,
  String details,
  String priceTag,
  Function() fun
){
  return   Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
                        width: 173,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Color(0xffE2E2E2), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(imageUrl, height: 62.5,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(foodName, 
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),),
                                      Text(details, 
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$ $priceTag", 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),),               
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: myGreenColor
                                ),
                                onPressed: fun, 
                                icon: Icon(Icons.add, color: Colors.white,))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
  );
}


//تصميم ازرار طرق الحفاظعلى البيئة
Widget envGridViewContainer(
  String imgUrl,
  String txt,
  Function() fun
){
  return  GestureDetector(
    onTap: fun,
    child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(154, 0, 0, 0),
                        offset: Offset(0, 4),
                        blurRadius: 4 )
                    ]
                  ),
                  child: Column(
                    children: [
                      Image.asset(imgUrl),
                      Text(txt, textAlign: TextAlign.center,)
                    ],
                  ),
                ),
  );
}