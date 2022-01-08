// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_escapes, unnecessary_new, unused_local_variable, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning1/Screens/signUp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void SignIn(BuildContext context, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                sharedPref(),
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  sharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", emailController.text);
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_background.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //       "https://images.unsplash.com/photo-1522441815192-d9f04eb0615c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), // <-- BACKGROUND IMAGE
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 400,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Login Page",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.deepPurple),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            child: Column(
                              children: [
                                // emailField,
                                // passwordField,
                                TextFormField(
                                  autofocus: false,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Username cannot be empty";
                                    } else if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return "Please enter a valid email address";
                                    }
                                    // if (value != 'mehtab') {
                                    //   return "Username that you've entered is incorrect";
                                    // }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "Enter UserName",
                                      prefixIcon: Icon(Icons.email),
                                      labelText: "UserName"),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  autofocus: false,
                                  controller: passwordController,
                                  onSaved: (value) {
                                    passwordController.text = value!;
                                  },
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    } else if (!regex.hasMatch(value)) {
                                      return "Please enter valid password (Minimum 6 characters)";
                                    }
                                    // if (value != 'test1234') {
                                    //   return "Password that you've entered is incorrect";
                                    // }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "Enter Password",
                                      prefixIcon: Icon(Icons.vpn_key),
                                      labelText: "Password"),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    SignIn(context, emailController.text,
                                        passwordController.text)
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text("LogIn",
                                          style: TextStyle(fontSize: 18))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "do not have Account? SignUp",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
