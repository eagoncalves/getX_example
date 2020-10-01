import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/product.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];

  List<Product> get products => _products;

  Map<String, Product> _favorites = Map();

  Map<String, Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    this._loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    update(['products']);
  }

  void onFavorite(int index, bool isFavorite) {
    Product product = this._products[index];
    product.isFavorite = isFavorite;

    if (isFavorite) {
      this._favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }
    update(['products', 'favorites']);
  }
}
