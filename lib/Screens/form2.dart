// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison, avoid_print, unused_field, prefer_final_fields, unused_local_variable, non_constant_identifier_names, override_on_non_overriding_member, annotate_overrides, unused_import, prefer_const_literals_to_create_immutables, await_only_futures

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormSubmitted extends StatefulWidget {
  @override
  State<FormSubmitted> createState() => _FormSubmittedState();
}

class _FormSubmittedState extends State<FormSubmitted> {
  // String data
  void getStringFromPreferrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fname = await prefs.getString("first_name")!;
    lname = await prefs.getString("last_name")!;
    email = await prefs.getString("e-mail")!;
    password = await prefs.getString("passwordd")!;
    phone = await prefs.getString("phone#")!;
  }

  @override
  String fname = '';
  String lname = '';
  String email = '';
  String password = '';
  String phone = '';
  void initState() {
    super.initState();
    getStringFromPreferrences();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form 2"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              'First Name : $fname',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'last Name : $lname',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'E-Mail Address : $email',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'Password : $password',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'Phone# : $phone',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
