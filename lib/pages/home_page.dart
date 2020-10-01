import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_example/controllers/global_controller.dart';
import 'package:getx_example/controllers/home_controller.dart';
import 'package:getx_example/pages/home_pages_widgets/home_label.dart';
import 'package:getx_example/widgets/products_list.dart';

import 'home_pages_widgets/home_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                    id: 'favorites',
                    builder: (_) => FlatButton(
                          child: Text(
                            'Favorites ${_.favorites.length}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ))
              ],
              title: Text('GetX'),
            ),
            body: Center(
              child: ProductsList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.increment();
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
