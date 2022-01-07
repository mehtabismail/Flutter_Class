// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning1/Screens/storage_service.dart';
import 'package:learning1/model/user_model.dart';

class UploadFruitData extends StatefulWidget {
  @override
  _UploadFruitDataState createState() => _UploadFruitDataState();
}

class _UploadFruitDataState extends State<UploadFruitData> {
  final _formKey = GlobalKey<FormState>();
  final Storage storage = new Storage();
  //  TEXTFIELD CONTROLLERS
  TextEditingController fruitNameController = new TextEditingController();
  TextEditingController fruitDescriptionController =
      new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  var path;
  var fileName;
  Future pickImage(BuildContext context) async {
    // SELLECTING FILE
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );
    if (results == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No file Selected!"),
        ),
      );
      return null;
    }
    setState(() {
      path = results.files.single.path;
      fileName = results.files.single.name;
    });

    // CALLING UPLOAD FUNCTION
    // storage.uploadFile(path, fileName);
    storage.uploadFile(path, fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Data"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        // FRUIT NAME TEXTFIELD
                        TextFormField(
                          autofocus: false,
                          controller: fruitNameController,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            fruitNameController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              contentPadding:
                                  new EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: "Enter Fruite Name",
                              labelText: "Fruit Name"),
                        ),
                        // FRUIT DESCRIPTION TEXTFIELD
                        TextFormField(
                          autofocus: false,
                          controller: fruitDescriptionController,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            fruitDescriptionController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Enter Fruit Description",
                            labelText: "Fruit description",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 10.0),
                          ),
                        ),

                        // SIZED BOX
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pickImage(context);
                          },
                          child: Text("Upload Image",
                              style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // SIGN UP BUTTON
                        ElevatedButton(
                          onPressed: () async {
                            print("hello");
                            await FirebaseFirestore.instance
                                .collection('FruitsData')
                                .add({
                              'title': fruitNameController.text,
                              'description': fruitDescriptionController.text,
                              'image': fileName,
                            });
                            // SHOWING TOAST MESSAGE
                            Fluttertoast.showToast(
                                msg: "Data Uploaded Successfully");
                          },
                          child: Text("Upload Data",
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
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

  final _auth = FirebaseAuth.instance;
  // void postDetailsToFireStore() async {
  //   // CALLING OUR FIRESTORE
  //   // CALLING OUR USERMODEL
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //   UserModel userModel = UserModel();

  //   // WRITTING ALL THE VALUES
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.firstName = firstNameController.text;
  //   userModel.secondName = secondNameController.text;

  //   // SENDING THESE VALUES TO FIRESTORE
  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(user.uid)
  //       .set(userModel.toMap());
  //   // SHOWING TOAST MESSAGE
  //   Fluttertoast.showToast(msg: "Fruit Added Successfully");
  // }

}
