// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning1/Screens/form_submission.dart';
import 'package:learning1/Screens/fruitList.dart';
import 'package:learning1/Screens/fruit_todos.dart';
import 'package:learning1/Screens/home_screen.dart';
import 'package:learning1/Screens/login_screen.dart';
import 'package:learning1/Screens/productListView.dart';
import 'package:learning1/Screens/uploadData.dart';
import 'package:learning1/Screens/uploadFruit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool admin = true;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (user!.email == "admin@test.com") {
      admin = true;
    }
    if (user!.email != "admin@test.com") {
      admin = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Mehtab Ismal"),
              accountEmail: Text("mehtabismail@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1087816631009587202/3D19wefj.jpg")),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Home',
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.list_bullet,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Fruit List',
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => FruitList())),
          ),
          (admin == true)
              ? ListTile(
                  leading: Icon(
                    CupertinoIcons.cloud_upload,
                    color: Colors.deepPurple,
                  ),
                  title: Text(
                    'Upload Fruits Data',
                    textScaleFactor: 1.3,
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadFruitData())),
                )
              : Container(),
          ListTile(
            leading: Icon(
              CupertinoIcons.plus,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Fruit Todos',
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => FruitTodos())),
          ),
          ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.deepPurple,
                ),
                color: Colors.deepPurple,
                onPressed: () {},
              ),
              title: Text(
                'Log Out',
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Fluttertoast.showToast(msg: "LogOut Successfully");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
    );
  }
}
