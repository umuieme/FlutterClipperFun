import 'package:custom_clipper/custom_clipper/zigzag.dart';
import 'package:flutter/material.dart';

var items = [
  Item("Triangle", "assets/banner.png", "The image is down pointed traingle",
      ClipType.traingle),
  Item("Arc", "assets/banner.png",
      "The bottom edge of the above edge is arc-shaped", ClipType.arc),
  Item(
      "Pointed Edge multiple ",
      "assets/banner.png",
      "The bottom edge of the above image is multiple pointed.",
      ClipType.pointed),
  Item("Rounded multiple curve", "assets/banner.png",
      "The bottom edge of the above image is multiple rounded", ClipType.curved),

  Item("Rounded multiple curve", "assets/banner.png",
      "The bottom edge of the above image is wave", ClipType.waved)
];

class Item {
  final name;
  final image;
  final description;
  final clipType;

  Item(this.name, this.image, this.description, this.clipType);
}

class CardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: ListView(
            children: items.map((item) => createClippedWidget(item)).toList()),
      ),
    );
  }

  Widget createClippedWidget(Item item) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(16),
      color: Colors.green
      ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ZigZag(
              clipType: item.clipType,
              child: Image.asset(
                item.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.name,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: Text(item.description, style: TextStyle(fontSize: 18, color: Colors.white70),),
          )
        ],
      ),
    );
  }
}
