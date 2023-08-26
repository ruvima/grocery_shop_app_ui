// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String id;
  final String name;
  final double price;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, image: $image)';
  }
}
