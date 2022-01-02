// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_escapes, unnecessary_new, unused_local_variable, unused_import, file_names, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning1/Screens/home_screen.dart';
import 'package:learning1/model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  //  TEXTFIELD CONTROLLERS
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController secondNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  void signUp(String email, String password) async {
    print("signup pressed");
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFireStore()})
          .catchError((e) => {Fluttertoast.showToast(msg: e!.message)});
    }
  }

  void postDetailsToFireStore() async {
    // CALLING OUR FIRESTORE
    // CALLING OUR USERMODEL
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // WRITTING ALL THE VALUES
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.secondName = secondNameController.text;

    // SENDING THESE VALUES TO FIRESTORE
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    // SHOWING TOAST MESSAGE
    Fluttertoast.showToast(msg: "Account Created Successfully");

    // NAVIGATE TO HOME SCREEN
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1522441815192-d9f04eb0615c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            constraints: BoxConstraints(
              maxHeight: 800,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "SignUp Page",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepPurple),
                      ),
                    ),
                    // SIZED BOX
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Column(
                        children: [
                          // FIRST NAME TEXTFIELD
                          TextFormField(
                            autofocus: false,
                            controller: firstNameController,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              firstNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First Name cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter First Name",
                                labelText: "First Name"),
                          ),
                          // SECOND NAME TEXTFIELD
                          TextFormField(
                            autofocus: false,
                            controller: secondNameController,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              secondNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Second Name cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Second Name",
                                labelText: "Second Name"),
                          ),
                          // E-MAIL TEXTFIELD
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
                                return "Email cannot be empty";
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter email address",
                                labelText: "email"),
                          ),
                          // PASSWORD TEXTFIELD
                          TextFormField(
                            autofocus: false,
                            controller: passwordController,
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password"),
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
                          ),
                          // CONFIRM PASSWORD TEXTFIELD
                          TextFormField(
                            obscureText: true,
                            autofocus: false,
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              confirmPasswordController.text = value!;
                            },
                            validator: (value) {
                              if (confirmPasswordController.text !=
                                  passwordController.text) {
                                return "Password don't match";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Confirm Password"),
                          ),
                          // SIZED BOX
                          SizedBox(
                            height: 30,
                          ),
                          // SIGN UP BUTTON
                          ElevatedButton(
                            onPressed: () {
                              // print("hello1");
                              // if (_formKey.currentState!.validate()) {
                              //   print("hello2");
                              // }
                              signUp(emailController.text,
                                  passwordController.text);
                            },
                            child:
                                Text("SignUp", style: TextStyle(fontSize: 18)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
