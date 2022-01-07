// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning1/Screens/storage_service.dart';

class FruitList extends StatefulWidget {
  @override
  _FruitListState createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  @override
  Widget build(BuildContext context) {
    Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit List'),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('FruitsData').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Gestures(document)));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      color: Colors.deepOrangeAccent.shade100,
                      child: Row(
                        children: [
                          FutureBuilder(
                              future: storage.downloadURL(document['image']),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        snapshot.data!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                return Container();
                              }),
                          Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Text(
                                    document['title'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                      child: Text(
                                    document['description'],
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Gestures extends StatefulWidget {
  Gestures(QueryDocumentSnapshot<Object?> document);

  @override
  _GesturesState createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("heelo"),
      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/images/apple2.jpg')),
          Text(
              'An apple is an edible fruit produced by an apple tree & cultivated worldwide very delecius in tase '),
          ElevatedButton(
              onPressed: () {
                testing();
              },
              child: Text("check")),
        ],
      ),
    );
  }

  testing() {
    print("hello");
  }
}
