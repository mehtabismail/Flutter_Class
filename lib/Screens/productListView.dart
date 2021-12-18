// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning1/Screens/fruitList.dart';
import 'package:learning1/Screens/vehicleList.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product List Category'),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // color: Colors.grey.shade600,
              width: 100,
              height: 110,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // decoration: BoxDecoration(color: Colors.black),
                    width: 100,
                    height: 70,
                    child: IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: Icon(
                          FontAwesomeIcons.appleAlt,
                          size: 60, //Icon Size
                          color: Colors.deepPurple, //Color Of Icon
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FruitList()));
                        }),
                  ),
                  Container(
                      child: Text(
                    "Fruits",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.deepOrange.shade400),
                  ))
                ],
              ),
            ),
            Container(
              // color: Colors.grey.shade600,
              width: 100,
              height: 110,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // decoration: BoxDecoration(color: Colors.black),
                    width: 100,
                    height: 70,
                    child: IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: Icon(
                          FontAwesomeIcons.biking,
                          size: 60, //Icon Size
                          color: Colors.deepPurple, //Color Of Icon
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VehicleList()));
                        }),
                  ),
                  Container(
                      child: Text(
                    "Vehicle",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.deepOrange.shade400),
                  ))
                ],
              ),
            ),
          ],
        )));
  }
}
