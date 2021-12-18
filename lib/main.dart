// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:learning1/Screens/form_submission.dart';
import './Screens/home_screen.dart';
import './Screens/login_screen.dart';
import 'Screens/productListView.dart';

void main() {
  runApp(MaterialApp(
    //  DARK THEME
    darkTheme: ThemeData(brightness: Brightness.dark),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    themeMode: ThemeMode.light,

    //  Disable Debug Flag
    debugShowCheckedModeBanner: false,

    //  Routes
    initialRoute: '/Product_List',
    routes: {
      // '/': (context) => LoginScreen(),
      // '/LoginScreen': (context) => LoginScreen(),
      // '/HomeScreen': (context) => HomeScreen(),
      // '/SignUp': (context) => SignUpScreen(),
      // '/Form_Submisson': (context) => FormSubmiission(),
      // '/Form_Submitted': (context) => FormSubmitted(),
      '/Product_List': (context) => ProductList(),
    },
  ));
}
