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
    getValidationData().whenComplete(() async => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      (finalEmail == '' ? LoginScreen() : HomeScreen())))
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
    return Container();
  }
}
