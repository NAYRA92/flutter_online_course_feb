import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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

  String userName = "";
  String userPassword = "";

  Future<bool> checkExist (
    String mobile
  ) async {
    try{
      await FirebaseFirestore.instance
    .collection("users").doc(mobile).get().then((doc){
      if(doc.exists){
        //if document, aka user, exists, then bring the data
        Map<String, dynamic> docData = doc.data()!;
        userName = docData['name'];
        userPassword = docData['password'];

        if(userPassword == _password.text){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> HomePage()));
        }
        return true;
      }
      else if(!doc.exists){
        setState(() {
          errorMessage = "User Not Exist";
        });
        return false;
      }
    }
    );
    }
    catch(error){
       setState(() {
          errorMessage = "Error $error";
        });
      print(error);
    }

      return false;
  }


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
                    hintText: "رقم الجوال",
                    labelText: "رقم الجوال",
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
                    checkExist(_name.text);

                    // if(_name.text == "nayra" && _password.text == "123"){
                    //   setState(() {
                    //  errorMessage = "";
                    //   });
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    // }
                    // else{
                    //   //هنا يتم كتابة رسالة الخطأ
                    //   setState(() {
                    //     errorMessage = "تحقق من البيانات المدخلة";
                    //   });
                    // }

                  }, 
                  child: Text("تسجيل دخول")),
                Text(errorMessage),
                TextButton(
                  onPressed: (){}, 
                  child: Text("مستخدم جديد؟ تسجيل حساب")),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CircularPercentIndicator(
                //       radius: 30.0,
                //       lineWidth: 5.0,
                //       percent: 0.5,
                //       center: Text("50%"),
                //       progressColor: Colors.green,
                //     ),
                //      CircularPercentIndicator(
                //       radius: 30.0,
                //       lineWidth: 5.0,
                //       percent: 0.5,
                //       center: Text("50%"),
                //       progressColor: Colors.blue,
                //     ),
                //      CircularPercentIndicator(
                //       radius: 30.0,
                //       lineWidth: 5.0,
                //       percent: 0.5,
                //       center: Text("50%"),
                //       progressColor: Colors.orange,
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}