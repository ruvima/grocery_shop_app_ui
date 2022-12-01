import 'package:flutter/animation.dart' show Color;

class Item {
  final String name;
  final double price;
  final String image;
  final Color color;

  Item({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
  });
}
