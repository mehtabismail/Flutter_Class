//ignore_for_file: prefer_const_constructors, unused_import, unnecessary_question_mark

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning1/Screens/form2.dart';
import 'package:learning1/Screens/form_submission.dart';
import 'package:learning1/Screens/signUp_screen.dart';
import 'package:learning1/Services/auth_services.dart';
import './Screens/home_screen.dart';
import './Screens/login_screen.dart';
import 'Screens/productListView.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // FIREBASE AUTHENTICATION $ INITIALIZATION
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await AuthService().getOrCreateUser();
  // START RUNNING APP
  runApp(MaterialApp(
    //  DARK THEME
    darkTheme: ThemeData(brightness: Brightness.dark),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    themeMode: ThemeMode.light,

    //  Disable Debug Flag
    debugShowCheckedModeBanner: false,

    //  Routes
    initialRoute: '/LoginScreen',
    routes: {
      '/': (context) => LoginScreen(),
      '/LoginScreen': (context) => LoginScreen(),
      // '/HomeScreen': (context) => HomeScreen(),
      '/SignUp': (context) => SignUpScreen(),
      // '/Form_Submisson': (context) => FormSubmiission(),
      // '/Form_Submitted': (context) => FormSubmitted(),
      // '/Product_List': (context) => ProductList(),
    },
  ));
}
