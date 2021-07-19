import 'package:authentication_project/screens/signin.dart';
import 'package:authentication_project/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSignInForm = true;

  void switchForm() {
    setState(() {
      showSignInForm = !showSignInForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showSignInForm
          ? Signin(switchForm: switchForm)
          : Signup(switchForm: switchForm),
    );
  }
}
