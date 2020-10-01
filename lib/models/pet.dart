import 'package:get/get.dart';
import 'package:meta/meta.dart';

//class Pet {
//  String name;
//  int age;
//
//  Pet({
//    @required this.name,
//    @required this.age,
//  });
//
//  Pet copyWith({String name, int age}) {
//    return Pet(name: name ?? this.name, age: age ?? this.age);
//  }
//}

class RxPet {
  final RxString name;
  final RxInt age;

  RxPet({
    @required this.name,
    @required this.age,
  });
}

class Pet {
  RxPet rxPet;

  Pet({
    @required String name,
    @required int age,
  }) {
    this.rxPet = RxPet(name: name.obs, age: age.obs);
  }

  String get name => this.rxPet.name.value;

  int get age => this.rxPet.age.value;

  set name(String name) {
    this.rxPet.name.value = name;
  }

  set age(int age) {
    this.rxPet.age.value = age;
  }
}
