import 'package:meta/meta.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rate;
  final String linkPhoto;
  bool isFavorite = false;

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.rate,
    @required this.linkPhoto,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Product ID'],
      description: json['Description'],
      name: json['Name'],
      price: json['Price'].toDouble(),
      rate: json['Rating Avg'].toDouble(),
      linkPhoto: json['Thumbnail URL'],
    );
  }
}
