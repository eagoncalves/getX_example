import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/global_controller.dart';
import 'package:getx_example/controllers/socket_client_controller.dart';
import 'package:getx_example/pages/home_page.dart';
import 'package:getx_example/pages/reactive_page.dart';
import 'package:getx_example/pages/reactive_page2.dart';
import 'package:getx_example/pages/reactive_page3.dart';
import 'package:getx_example/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ReactivePage3() //SplashPage(),
        );
  }
}
