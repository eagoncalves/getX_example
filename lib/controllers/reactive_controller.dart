import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_example/controllers/socket_client_controller.dart';
import 'package:getx_example/models/pet.dart';

class ReactiveController extends GetxController {
  //Define counter as observable
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;


  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItens = Map<String, dynamic>().obs;
  StreamSubscription<String> _subscription;

  Pet myPet = Pet(name: 'Nike', age: 5);

  @override
  void onInit() {
    super.onInit();
    final SocketClientController socketClientController =
        Get.find<SocketClientController>();
    _subscription = socketClientController.message.listen((String data) {
//      print('message::: ${data}');
    });
  }

  @override
  FutureOr onClose() {
    _subscription?.cancel();
    return super.onClose();
  }

  void increment() {
    counter.value++;
    // This method (Update()) became uneccessary when we use observables  - update();
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    mapItens.add(DateTime.now().toString(), DateTime.now().toString());
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void setAgePet(int age) {
    myPet.age = age;
  }
}
