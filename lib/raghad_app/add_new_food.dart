import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/constants.dart';

class AddNewFood extends StatefulWidget {
  const AddNewFood({super.key});

  @override
  State<AddNewFood> createState() => _AddNewFoodState();
}

List<String> _categoryList = ["Fruit", "Vegitables", "Diary"];

class _AddNewFoodState extends State<AddNewFood> {
  String dropdownValue = _categoryList.first;

  TextEditingController _name = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _imgUrl = TextEditingController();
  TextEditingController _unit = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            addNewFoodTextField("Food Name", _name, Icons.food_bank),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(height: 2, color: Colors.deepPurpleAccent),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items:
                  _categoryList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
            // addNewFoodTextField("Category", _category, Icons.category),
            addNewFoodTextField("Image Url", _imgUrl, Icons.image),
            addNewFoodTextField("Unit", _unit, Icons.widgets),
            addNewFoodTextField("Price", _price, Icons.money),

            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection("gerocery").add({
                    "name": _name.text,
                    "category": dropdownValue,
                    "img": _imgUrl.text,
                    "unit": _unit.text,
                    "price": int.parse(_price.text)
                  });
                  _name.clear();
                  _category.clear();
                  _imgUrl.clear();
                  _unit.clear();
                  _price.clear();
                },
                child: Text("ADD NEW FOOD"))
          ],
        ),
      ),
    );
  }
}
