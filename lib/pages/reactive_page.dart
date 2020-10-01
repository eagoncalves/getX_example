import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        print('reactive');
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () {
                  print('Updating Counter');
                  return Text(
                    '${_.counter.value}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
              Obx(
                () {
                  print('Updating currentDate');
                  return Text(
                    '${_.currentDate.value}',
                    style: TextStyle(fontSize: 20),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                child: Icon(Icons.add),
                onPressed: () {
                  _.increment();
                },
              ),
              SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                heroTag: 'date',
                child: Icon(Icons.calendar_today),
                onPressed: () {
                  _.getDate();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
