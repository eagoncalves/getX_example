import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/home_controller.dart';
import 'package:getx_example/models/users.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) => _.loading ? CircularProgressIndicator() : ListView.builder(
        itemBuilder: (context, index) {
          final User user = _.users[index];
          return ListTile(
            title: Text(user.first_name),
            subtitle: Text(user.email),
            onTap: (){
              _.showUserProfile(user);
            },
          );
        },
        itemCount: _.users.length,
      ),
    );
  }
}
