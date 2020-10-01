import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/reactive_controller.dart';
import 'package:getx_example/controllers/socket_client_controller.dart';

class ReactivePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SocketClientController _socketController =
        Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        return Scaffold(
            body: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  onChanged: (text) {
                    _socketController.searchText(text);
                  },
                ),
                Text(
                  '${_socketController.searchText}',
                  style: TextStyle(fontSize: 35),
                ),
//                Text(
//                  '${_.myPet.name}',
//                  style: TextStyle(fontSize: 35),
//                ),
//                Text(
//                  '${_.myPet.age}',
//                  style: TextStyle(fontSize: 35),
//                ),
//                Text(
//                  '${_socketController.message.value}',
//                  style: TextStyle(fontSize: 12),
//                ),
//                Text(
//                  '${_socketController.counter.value}',
//                  style: TextStyle(fontSize: 25),
//                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Text('Change age'),
                    onPressed: () => _.setAgePet(_.myPet.age + 1))
              ],
            ),
          ),
        ));
      },
    );
  }
}
