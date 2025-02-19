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

  bool visible_icon = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image(
                  image: AssetImage("images/logo.png"), //عشان نظهر صورة من التطبيق محلية
                  width: 150,
                  height: 150,
                  ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: "اسم المستخدم",
                    labelText: "الاسم الرباعي",
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: _password,
                  obscureText: visible_icon ? false : true,
                  decoration: InputDecoration(
                    hintText: "كلمة المرور",
                    labelText: "كلمة المرور",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          visible_icon ? visible_icon = false : visible_icon = true;
                        });
                      }, 
                      icon: Icon(
                        visible_icon ? Icons.visibility : Icons.visibility_off
                        ),
                      )
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
                TextButton(
                  onPressed: (){}, 
                  child: Text("مستخدم جديد؟ تسجيل حساب"))
                ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}