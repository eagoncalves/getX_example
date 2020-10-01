import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/reactive_controller.dart';

class ReactivePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        print('reactive');
        return Scaffold(
          body: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListView.builder(
                itemCount: _.items.length,
                itemBuilder: (context, index) => ListTile(
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _.removeItem(index);
                    },
                  ),
                  title: Text(
                    _.items[index],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'add',
            child: Icon(Icons.add),
            onPressed: () {
              _.addItem();
            },
          ),
        );
      },
    );
  }
}
