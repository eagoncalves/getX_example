import 'package:dio/dio.dart';
import 'package:getx_example/models/users.dart';

class UsersApi {
  UsersApi._internal();

  static UsersApi _instance = UsersApi._internal();

  static UsersApi get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response =
          await this._dio.get('https://reqres.in/api/users', queryParameters: {
        'page': page,
        'delay': 5,
      });

      return (response.data['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      print('Error on getUsers => $e');
      return null;
    }
  }
}
