import 'dart:async';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;

  RxString get message => _message;

  RxInt _counter = 0.obs;

  RxInt get counter => _counter;

  RxString _searchText = "".obs;

  RxString get searchText => _searchText;

  Timer _timer;
  Timer _timerCounter;

  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  @override
  FutureOr onClose() {
    _timer?.cancel();
    _timerCounter?.cancel();
    return super.onClose();
  }

  _init() {
//    ever(_searchText, (_) {
//      //Ever is used each time the _counter is changed
//      print('_searchText Ever ${_searchText.value}');
//    });

//    once(_counter, (_) {
//      //Once will be execute only one time
//      print('_counter has been changed and showed only one time ${_counter.value}');
//    });

//    debounce(_searchText, (_) {
//      //Debounce accept a 3rd parameter that's define delay time to execute the print.
//      print(
//          '_searcText Debounce ${_searchText.value}');
//    }, time: Duration(milliseconds: 800));

    interval(_searchText, (_) {
      //Seems like debouce however use a interval to execute accept a 3rd parameter that's define delay time to execute the print.
      print(
          '_searcText Debounce ${_searchText.value}');
    }, time: Duration(milliseconds: 800));

    //Using the timer
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _message.value = _faker.lorem.sentence();
    });

    _timerCounter = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _counter.value++;
    });
  }

  void setSearchText(String value) {
    this._searchText.value = value;
  }
}
