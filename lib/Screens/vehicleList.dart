// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    final titles = [
      'Bike',
      'Boat',
      'Bus',
      'Car',
      'Railway',
      'Run',
      'Subway',
      'Transit',
      'Talk',
      'Alarm',
      'Call'
    ];

    final subTitles = [
      'Bike is used for cycling and for moving Purposes',
      'Boat is Used to Cross the river for those who does not know about swimming',
      'Bus is mainly used for the traveling purpose',
      'Car is very comfortable vehicle to trvel',
      'Railway is a Government sector for local travelers across the country',
      'Run is physical ability of a person to move from one place to anoother',
      'Subway is underground railway track for travelling ',
      'Transit is also an Icon in cupertino widgets',
      'Peaple talk to their loved oones on mobile phone from distance',
      'Alarm is used to awake people on time with its noise',
      'Call is a function used to place and talk with expected person'
    ];

    final icons = [
      Icons.directions_bike,
      Icons.directions_boat,
      Icons.directions_bus,
      Icons.directions_car,
      Icons.directions_railway,
      Icons.directions_run,
      Icons.directions_subway,
      Icons.directions_transit,
      Icons.directions_walk,
      Icons.access_alarm_outlined,
      Icons.add_call
    ];
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                color: Colors.deepOrangeAccent.shade100,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(icons[index]),
                    title: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Center(
                        child: Text(
                          titles[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      subTitles[index],
                    ),
                    // trailing: Image(
                    //   image: AssetImage('assets/images/apple2.jpg'),
                    // ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
