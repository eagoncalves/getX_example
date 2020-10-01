import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/users.dart';

class ProfileController extends GetxController {
  User _user;

  User get user => _user;

  String _inputText = '';

  String get inputText => _inputText;

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChange(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText );
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
            title: Text('ERROR'),
            message: Text('Emtry is not valid'),
            cancelButton: CupertinoActionSheetAction(
                child: Text('OK'),
                onPressed: () {
                  Get.back();
                })),
      );

//      Get.dialog(AlertDialog(
//        title: Text('Error'),
//        content: Text('Entre com um valor valido.'),
//        actions: [
//          FlatButton(onPressed: () {
//            Get.back();
//          }, child: Text('OK'),)
//        ],
//      ),);
//    }
    }
  }
}
