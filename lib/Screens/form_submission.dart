// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison, avoid_print, unused_field, prefer_final_fields, unused_local_variable, non_constant_identifier_names, override_on_non_overriding_member, annotate_overrides, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learning1/Screens/form2.dart';
import 'package:learning1/Screens/shared_prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormSubmiission extends StatefulWidget {
  @override
  State<FormSubmiission> createState() => _FormSubmiissionState();
}

class _FormSubmiissionState extends State<FormSubmiission> {
  final _formKey = GlobalKey<FormState>();

  void setStringInPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('first_name', fName).then((value) => print(value));
    await prefs.setString('last_name', lName).then((value) => print(value));
    await prefs.setString('e-mail', e_mail).then((value) => print(value));
    await prefs.setString('passwordd', password).then((value) => print(value));
    await prefs.setString('phone#', phone).then((value) => print(value));
  }

  @override
  String fName = "";
  String lName = '';
  String e_mail = '';
  String password = '';
  String phone = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your First Name',
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty First Name!';
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      fName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your Last Name',
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty Last Name!';
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      lName = value;
                    });
                  },
                ),
                TextFormField(
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                      hintText: 'Enter Email', labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    setState(() {
                      e_mail = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Password', labelText: 'password'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid password!';
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter a phone number',
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid password!';
                    }
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Setting Shared Preferences
                        setStringInPreferences();
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FormSubmitted()));
                        }
                        // if (_formKey.currentState!.validate()) {
                        //   // If the form is valid, display a snackbar. In the real world,
                        //   // you'd often call a server or save the information in a database.
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')),
                        //   );
                        // }
                      },
                      child: const Text('Submit Form'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
