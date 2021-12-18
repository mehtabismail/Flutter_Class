// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning1/Screens/drawer.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
          'WELCOME to Dashboard',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
