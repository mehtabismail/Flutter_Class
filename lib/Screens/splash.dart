// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning1/Screens/home_screen.dart';
import 'package:learning1/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = '';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("WidgetsBinding");
      Future.delayed(Duration(seconds: 5), () {
        print('yo hey');
        getValidationData().whenComplete(() async => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          (finalEmail == '' ? LoginScreen() : HomeScreen())))
            });
      });
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.deepPurple,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              // height: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.contain,
                width: 300,
              ),
            ),
            Container(
                // height: double.infinity,
                // alignment: Alignment.bottomCenter,
                child: Text(
              "Health With Fruits",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
            SizedBox(
              height: 50,
            ),
            // CircularProgressIndicator()
          ],
        ),
      ),
    ));
  }
}
