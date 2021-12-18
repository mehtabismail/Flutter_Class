// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class FruitList extends StatefulWidget {
  @override
  _FruitListState createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/apple2.jpg',
      'assets/images/apricots.jfif',
      'assets/images/banana.jfif',
      'assets/images/cherries.jpg',
      'assets/images/grapes.jpg',
      'assets/images/plum.jfif',
      'assets/images/orange.jfif',
      'assets/images/mango.jfif',
      'assets/images/pomegranate.jpg',
      'assets/images/strawberries.jfif',
      'assets/images/watermelon.jfif',
    ];
    final titles = [
      'Apple',
      'Apricots',
      'Banana',
      'Cherries',
      'Grapes',
      'Java-Plum',
      'Oranges',
      'Mango',
      'Pomegrant',
      'Strawberries',
      'watermelons',
    ];

    final subTitles = [
      'An apple is an edible fruit produced by an apple tree & cultivated worldwide very delecius in tase ',
      'An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus',
      'A banana is an elongated, edible fruit also bananas used for cooking may be called "plantains"',
      'A cherry is the fruit of many plants of the genus Prunus, and is a fleshy drupe.',
      'A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant. ',
      'Java Plum is an evergreen tropical tree in the flowering plant family Myrtaceae',
      'The orange is the fruit of various citrus species in the family Rutaceae',
      'A mango is an edible stone fruit produced by the tropical tree Mangifera indica',
      'The pomegranate is a fruit-bearing deciduous shrub in the family Lythraceae',
      'The garden strawberry is a widely grown hybrid species of the genus Fragaria',
      'Watermelon is a flowering plant species of the Cucurbitaceae family of its edible fruit.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit List'),
      ),
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
                margin: const EdgeInsets.all(10),
                color: Colors.deepOrangeAccent.shade100,
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Gestures()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Container(
                        width: 80,
                        height: 100,
                        child: Image(
                          image: AssetImage(images[index]),
                        ),
                        // decoration: BoxDecoration(color: Colors.purple),
                      ),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Gestures extends StatefulWidget {
  @override
  _GesturesState createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures Performed"),
      ),
      body: Column(
        children: const [
          Image(image: AssetImage('assets/images/apple2.jpg')),
          Text(
              'An apple is an edible fruit produced by an apple tree & cultivated worldwide very delecius in tase ')
        ],
      ),
    );
  }
}
