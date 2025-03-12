import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/api_key.dart';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiAiPage extends StatefulWidget {
  const GeminiAiPage({super.key});

  @override
  State<GeminiAiPage> createState() => _GeminiAiPageState();
}
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: "your_api",
    generationConfig: GenerationConfig(
      temperature: 1,
      topK: 40,
      topP: 0.95,
      maxOutputTokens: 8192,
      responseMimeType: 'text/plain',
    ),
    systemInstruction: Content.system("الرجاء الرد على الاسئلة المتعلقة فقط بالبيئة، اي سؤال خارج موضوع البيئة انت تعتذر عن الاجابة")
    //system prompt
//     systemInstruction: Content.system(
//       """
//     عندما يتم طلب وصفة للسحور، اجلب وصفة مكونة من 5 مكونات فقط 
//     اذا طلب منك وصفة  من عدد مكونات غير 5 مكونات اعتذر عن الطلب بأنك مصمم فقط لجلب وصفات من 5 مكونات فقط
//     """
// ),
  );

  TextEditingController _chatMesssage = TextEditingController();
class _GeminiAiPageState extends State<GeminiAiPage> {


  String hello_message = "";
  
  void checkApiConnection(){
  final apiKey = "your_api";
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }
  }

  final chat = model.startChat();
  // final message = _chatMesssage.text;
  //'اكتب لي رسالة صباحية'

  Future<void> _generateHelloMessage(String msg) async {
  final content = Content.text(msg);
  final response = await chat.sendMessage(content);
  setState(() {
    hello_message = response.text!;
  });
  print(response.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _generateHelloMessage();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _chatMesssage,
              ),
              ElevatedButton(
                onPressed: (){
                  _generateHelloMessage(_chatMesssage.text);
                }, 
                child: Text("Here")),
              Text(hello_message, textAlign: TextAlign.center,),
            ],
          ),
        ),
      )
      ,
    );
  }
}