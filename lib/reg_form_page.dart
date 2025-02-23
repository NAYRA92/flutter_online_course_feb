import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/widgets_tobe_used/home_page.dart';

class RegFormPage extends StatefulWidget {
  const RegFormPage({super.key});

  @override
  State<RegFormPage> createState() => _RegFormPageState();
}

class _RegFormPageState extends State<RegFormPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(hintText: "اسم المستخدم"),
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(hintText: "كلمة المرور"),
              ),
              TextFormField(
                controller: _mobile,
                decoration: InputDecoration(hintText: "رقم الجوال"),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(_mobile.text)
                        .set({
                      "name": _name.text,
                      "mobile": _mobile.text,
                      "password": _password.text,
                    });
                    _name.clear();
                    _password.clear();
                    _mobile.clear();
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                  child: Text("تسجيل حساب جديد"))
            ],
          ),
        ),
      ),
    );
  }
}
