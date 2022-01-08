import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FruitTodos extends StatefulWidget {
  @override
  _FruitTodosState createState() => _FruitTodosState();
}

class _FruitTodosState extends State<FruitTodos> {
  bool admin = true;
  User? user = FirebaseAuth.instance.currentUser;
  String input = "";

  @override
  void initState() {
    super.initState();
  }

  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("todos").doc(input);

    Map<String, String> todos = {
      "todoTitle": input,
      'time': "Date & Time : ${DateTime.now().toString()}"
    };
    documentReference.set(todos).whenComplete(() => print("$input created"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("todos").doc(item);
    documentReference.delete().whenComplete(() => print("$item deleted"));
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Add Fruits To Eat"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('todos').snapshots(),
        builder: (context, snapshots) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
                return Dismissible(
                    key: Key(index.toString()),
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(10),
                        color: Colors.deepOrangeAccent.shade100,
                        child: Center(
                          child: ListTile(
                            title: Center(
                              child: Column(
                                children: [
                                  Text(
                                    documentSnapshot["todoTitle"],
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    documentSnapshot["time"],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            // trailing: IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         deleteTodo(documentSnapshot["todoTitle"]);
                            //       });
                            //     },
                            //     icon: Icon(
                            //       Icons.delete,
                            //       color: Colors.red,
                            //     )),
                          ),
                        ),
                      ),
                    ));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Add a Fruits You Want to Eat Today'),
                        content: TextField(
                          onChanged: (String value) => {input = value},
                          decoration: const InputDecoration(
                              hintText: 'Enter Fruit name here'),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('ADD'),
                            onPressed: () {
                              createTodos();
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    })
              },
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }
}
