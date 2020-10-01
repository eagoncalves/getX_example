import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('${_.user.first_name} ${_.user.last_name}'),
        ),
        body: GetBuilder<ProfileController>(
          builder: (_) => SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${_.user.first_name} ${_.user.last_name}'),
                SizedBox(
                  height: 15,
                ),
                CupertinoTextField(
                  onChanged: _.onInputTextChange,
                ),
                SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    _.goToBackWithData();
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
