// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning1/Screens/form_submission.dart';
import 'package:learning1/Screens/fruitList.dart';
import 'package:learning1/Screens/home_screen.dart';
import 'package:learning1/Screens/productListView.dart';
import 'package:learning1/Screens/uploadData.dart';
import 'package:learning1/Screens/uploadFruit.dart';

class MyDrawer extends StatelessWidget {
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
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.folder,
          //     color: Colors.deepPurple,
          //   ),
          //   title: Text(
          //     'Form Submission',
          //     textScaleFactor: 1.3,
          //     style: TextStyle(
          //         color: Colors.deepPurple, fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () => Navigator.pushReplacement(context,
          //       MaterialPageRoute(builder: (context) => FormSubmiission())),
          // ),
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
          ListTile(
            leading: Icon(
              CupertinoIcons.cloud_upload,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Upload Data',
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadFruitData())),
          )
        ],
      ),
    );
  }
}
