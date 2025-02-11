import 'package:flutter/material.dart';

import 'home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  String errorMessage = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image(
                  image: NetworkImage("https://storage.googleapis.com/cms-storage-bucket/3461c6a5b33c339001c5.jpg"),
                  width: 150,
                  height: 150,
                  ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: "اسم المستخدم",
                    labelText: "الاسم الرباعي",
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "كلمة المرور",
                    labelText: "كلمة المرور",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off)
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                    if(_name.text == "nayra" && _password.text == "123"){
                      setState(() {
                     errorMessage = "";
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    }
                    else{
                      //هنا يتم كتابة رسالة الخطأ
                      setState(() {
                        errorMessage = "تحقق من البيانات المدخلة";
                      });
                    }
                  }, 
                  child: Text("تسجيل دخول")),
                Text(errorMessage),
                Text("مستخدم جديد؟ تسجيل حساب"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}