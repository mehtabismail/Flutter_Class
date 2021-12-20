// import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

// void main() {
//   runApp(SignIn());
// }

// class SignIn extends StatefulWidget {
//   @override
//   _SignIState createState() => _SignIState();
// }

// class _SignIState extends State<SignIn> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     var _formKey;
//     MaterialPropertyResolver<Color?> getColor;
//     return MaterialApp(
//       darkTheme: ThemeData(brightness: Brightness.dark),
//       theme: ThemeData(primarySwatch: Colors.red),
//       themeMode: ThemeMode.light,
//       home: Scaffold(
//         appBar: AppBar(title: Text('Assignment 2'), actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.email),
//           ),
//         ]),
//         body: Stack(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 height: double.infinity,
//                 decoration: BoxDecoration(color: Colors.amber),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 //  URL Image from Network
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "https://images.unsplash.com/photo-1522441815192-d9f04eb0615c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), // <-- BACKGROUND IMAGE
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               height: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset('assets/images/apple.png'),
//                   Text(
//                     'Sign In',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.amber,
//                       fontSize: 35.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextFormField(
//                     autocorrect: false,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   TextFormField(
//                     autocorrect: false,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 25.0),
//                     width: double.infinity,
//                     child: RaisedButton(
//                       elevation: 5.0,
//                       padding: EdgeInsets.all(15.0),
//                       color: Colors.white,
//                       child: Text(
//                         'Sign in',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           letterSpacing: 1.0,
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Row(
//                     children: [
//                       Checkbox(
//                         checkColor: Colors.white,
//                         value: isChecked,
//                         onChanged: (bool? value) {
//                           setState(() {
//                             isChecked = value!;
//                           });
//                         },
//                       ),
//                       Text("Check Box")
//                     ],
//                   ),
//                   Row(children: [
//                     Radio(
//                         // ignore: prefer_void_to_null
//                         value: null,
//                         groupValue: null,
//                         onChanged: (Null? value) {}),
//                     Text("Radio Button")
//                   ]),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'Dont have an account?',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       FlatButton(
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
