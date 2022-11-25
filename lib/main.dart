import 'package:flutter/material.dart';
import 'package:project1/home_page.dart';
import 'package:project1/login_screen.dart';
import 'package:project1/signup_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/login",
    routes: {
      "/login":(_)=> LoginScreen(),
      "/signup":(_)=> SignUpScreen(),
      "/home":(_)=> HomePage()
    },
  ));
}
