import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_example/controllers/home_controller.dart';

class HomeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'text',
      builder: (_) => Text(
        _.counter.toString(),
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
