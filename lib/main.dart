import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_object_save/pages/home_page.dart';
import 'package:hive_object_save/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_object_save/pages/signup_page.dart';

void main() async{
  runApp(MyApp());

  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox("account");

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
      },
    );
  }
}