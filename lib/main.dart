import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course_feb/raghad_app/r_home_screen.dart';
import 'gemini_ai_page.dart';
import 'raghad_app/add_new_food.dart';
import 'reg_form_page.dart';
import 's_home_screen.dart';
import 'view_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //unerror will appear here, but it will go as soon as you import the needed Firebase packages
      options: FirebaseOptions(
          apiKey: "AIzaSyDTcDou3pm5N36dom-DWnpo-gjEMxUyxgc", //you will find apiKey, appId ... etc indside the google-services.json file that you download from firebase console!
          appId: "234930414650",
          messagingSenderId: "sendid",
          projectId: "my-name-464f2",
          storageBucket: "my-name-464f2.firebasestorage.app"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: "ElMessiri", //Gilroy
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: GeminiAiPage()
    );
  }
}

// import 'dart:io';

// import 'package:flutter_online_course_feb/api_key.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// void main() async {
//   final apiKey = myAPIKey;
//   if (apiKey == null) {
//     stderr.writeln(r'No $GEMINI_API_KEY environment variable');
//     exit(1);
//   }

//   final model = GenerativeModel(
//     model: 'gemini-2.0-flash',
//     apiKey: apiKey,
//     generationConfig: GenerationConfig(
//       temperature: 1,
//       topK: 40,
//       topP: 0.95,
//       maxOutputTokens: 8192,
//       responseMimeType: 'text/plain',
//     ),
//     systemInstruction: Content.system('عندما يتم طلب وصفة للسحور، اجلب وصفة مكونة من 5 مكونات فقط\nاذا طلب منك وصفة  من عدد مكونات غير 5 مكونات اعتذر عن الطلب بأنك مصمم فقط لجلب وصفات من 5 مكونات فقط'),
//   );

//   final chat = model.startChat(history: [
//     Content.multi([
//       TextPart('اريد وصفة للسحور'),
//     ]),
//     Content.model([
//       TextPart('بالتأكيد! إليك وصفة سريعة وسهلة ومغذية للسحور تتكون من 5 مكونات فقط:\n\n**زبادي بالفواكه والمكسرات**\n\n*   **المكونات:**\n    *   1 كوب زبادي (يفضل يوناني لزيادة البروتين)\n    *   1/2 كوب فراولة مقطعة أو أي فاكهة مفضلة (موز، توت، إلخ)\n    *   1/4 كوب مكسرات مشكلة (لوز، جوز، كاجو)\n    *   1 ملعقة كبيرة عسل (اختياري)\n    *   رشة قرفة (اختياري)\n\n*   **الطريقة:**\n    1.  ضع الزبادي في وعاء.\n    2.  أضف الفراولة أو الفاكهة المفضلة لديك.\n    3.  رش المكسرات المشكلة.\n    4.  إذا أردت، أضف ملعقة العسل ورشة القرفة.\n    5.  تناولها مباشرة واستمتع!\n\n**لماذا هذه الوصفة مناسبة للسحور؟**\n\n*   **الزبادي:** غني بالبروتين والكالسيوم، يساعد على الشعور بالشبع لفترة أطول.\n*   **الفواكه:** مصدر للفيتامينات والألياف، توفر الطاقة وتساعد على الهضم.\n*   **المكسرات:** تحتوي على دهون صحية وبروتين، تعزز الشعور بالشبع وتمنح الجسم الطاقة.\n*   **سهلة وسريعة:** لا تحتاج إلى وقت طويل للتحضير.\n\nصحة وعافية!'),
//     ]),
//     Content.multi([
//       TextPart('اريد وصفة من 3 مكونات\n'),
//     ]),
//     Content.model([
//       TextPart('تمام، إليك وصفة سريعة ومغذية للسحور بثلاثة مكونات فقط:\n\n**بيض بالجبن والخبز:**\n\n*   **المكونات:**\n    *   2 بيضة\n    *   شريحة جبن شيدر أو أي نوع مفضل\n    *   شريحة خبز أسمر أو أي نوع تفضل\n\n*   **الطريقة:**\n    1.  اخفق البيض في وعاء صغير.\n    2.  سخن مقلاة على نار متوسطة.\n    3.  اسكب البيض المخفوق في المقلاة.\n    4.  عندما يبدأ البيض بالنضوج، ضع شريحة الجبن فوقه.\n    5.  اطوِ البيض (أو اقلبه) حتى يذوب الجبن تمامًا.\n    6.  ضع البيض بالجبن فوق شريحة الخبز.\n    7.  تناولها مباشرة واستمتع!\n\n**لماذا هذه الوصفة مناسبة للسحور؟**\n\n*   **البيض:** مصدر ممتاز للبروتين، يساعد على الشعور بالشبع لفترة طويلة.\n*   **الجبن:** يضيف البروتين والكالسيوم، ويعطي نكهة لذيذة.\n*   **الخبز:** يوفر الكربوهيدرات المعقدة التي تمنح الجسم الطاقة تدريجيًا.\n\nصحة وهنا!\n'),
//     ]),
//     Content.multi([
//       TextPart('اريد وصفة من 3 مكونات'),
//     ]),
//     Content.model([
//       TextPart('أنا آسف، ولكنني مصمم فقط لجلب وصفات من 5 مكونات فقط. هل ترغب في وصفة تتكون من 5 مكونات للسحور؟\n'),
//     ]),
//     Content.multi([
//       TextPart('نعم'),
//     ]),
//     Content.model([
//       TextPart('حسناً، إليك وصفة سريعة وسهلة ومغذية للسحور تتكون من 5 مكونات فقط:\n\n**ساندويش التونة بالافوكادو**\n\n*   **المكونات:**\n\n    *   1 علبة تونة بالماء (مصفاة)\n    *   1/2 حبة أفوكادو مهروسة\n    *   1 ملعقة كبيرة مايونيز قليل الدسم\n    *   2 شريحة خبز أسمر\n    *   عصير ليمون (اختياري)\n\n*   **الطريقة:**\n\n    1.  في وعاء، اخلط التونة المصفاة مع الأفوكادو المهروس والمايونيز.\n    2.  أضف قطرات من عصير الليمون إذا كنت تفضل ذلك.\n    3.  ضع الخليط بين شريحتين من الخبز الأسمر.\n    4.  تناول الساندويش مباشرة.\n\n**لماذا هذه الوصفة مناسبة للسحور؟**\n\n*   **التونة:** غنية بالبروتين وأحماض أوميغا 3 الدهنية.\n*   **الأفوكادو:** مصدر للدهون الصحية والألياف.\n*   **المايونيز:** يضيف نكهة وقوام كريمي (يمكن استبداله بالزبادي اليوناني).\n*   **الخبز الأسمر:** يوفر الكربوهيدرات المعقدة والألياف.\n*   **سهلة وسريعة:** لا تحتاج إلى وقت طويل للتحضير.\n\nبالهناء والشفاء!'),
//     ]),
//   ]);
//   final message = 'INSERT_INPUT_HERE';
//   final content = Content.text(message);

//   final response = await chat.sendMessage(content);
//   print(response.text);
// }