import 'package:flutter/material.dart';

class RProductsDetailsPage extends StatefulWidget {
  //تعريف المتغيرات
  final String product_image;
  final String product_name;
  final String product_detail;
  final String product_price;

//استدعاء المتغيرات
  const RProductsDetailsPage(
      {super.key,
      required this.product_image,
      required this.product_name,
      required this.product_detail,
      required this.product_price});

  @override
  State<RProductsDetailsPage> createState() => _RProductsDetailsPageState();
}

class _RProductsDetailsPageState extends State<RProductsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 413,
            decoration: BoxDecoration(
                color: Color(0xffF2F3F2),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                image: DecorationImage(
                    image: NetworkImage(widget.product_image),
                    fit: BoxFit.cover,
                    opacity: .2 //لتغيير شفافية الصورة
                    )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  widget.product_image,)),
            ),
          ),
          Text(
            widget.product_name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Text(widget.product_detail),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )),
                    Text(
                      "1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
                Text(
                  "\$ ${widget.product_price}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
