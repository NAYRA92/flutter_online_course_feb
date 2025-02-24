import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("gerocery")
              .snapshots(), //from where to get the data
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            final _gerocerySnapshot = snapshot.data?.docs;

            return ListView.builder(
              itemCount: _gerocerySnapshot?.length,
              itemBuilder: (context, index) {
                return Text(_gerocerySnapshot?[index]["name"]);
              },
            );
          }),
    );
  }
}
