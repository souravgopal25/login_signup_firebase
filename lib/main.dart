import 'package:flutter/material.dart';
import 'package:login_signup_firebase/page/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Login-Signup",
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
    )
  );
}

