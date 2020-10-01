import 'package:get/get.dart';
import 'package:getx_example/api/users_api.dart';
import 'package:getx_example/models/users.dart';
import 'package:getx_example/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool  get loading => _loading;

  Future<void> loadUsers() async {
    this._users = await UsersApi.instance.getUsers(1);
    this._loading = false;
    update(['users']);
  }

  @override
  void onInit() {
    super.onInit();
    print('onInit is the same that initState');
  }

  @override
  void onReady() {
    super.onReady();
    print(
        ' onReady this method is fired whend the widget is completly renderized');
    this.loadUsers();
  }

  void increment() {
    this._counter++;
    /* This update normal
    *  update()
    * */

    /* This is update with parameter
    * update(['text']);
    */

    /* This update with parameter and condition */
    update(['text'], _counter >= 5);
  }

  Future<void> showUserProfile(User user) async {
    final result =  await Get.to(ProfilePage(), arguments: user);

    if (result != null){
      print('Resultado selecionado : ${result}');
    }
  }
}
