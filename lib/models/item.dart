import 'package:flutter/animation.dart' show Color;

class Item {
  final String name;
  final double price;
  final String image;
  final Color color;
  int count;

  Item({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    this.count = 0,
  });
  Item copyWith({
    String? name,
    double? price,
    String? image,
    Color? color,
    int? count,
  }) {
    return Item(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      color: color ?? this.color,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return 'Item(name: $name, price: $price, image: $image, color: $color, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.color == color;
  }

  @override
  int get hashCode {
    return name.hashCode ^ price.hashCode ^ image.hashCode ^ color.hashCode;
  }
}
