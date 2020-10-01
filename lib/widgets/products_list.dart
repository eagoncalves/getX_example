import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/global_controller.dart';
import 'package:getx_example/models/product.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
          itemCount: _.products.length,
          itemBuilder: (context, index) {
            final Product product = _.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('USD ${product.price.toString()}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  _.onFavorite(index, !product.isFavorite);
                },
              ),
            );
          }),
    );
  }
}
