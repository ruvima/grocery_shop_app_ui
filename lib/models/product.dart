class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, image: $image, category: $category)';
  }
}
