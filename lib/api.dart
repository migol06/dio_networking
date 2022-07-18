import 'package:dio/dio.dart';
import 'package:dio_networking/model/user_info.dart';

import 'model/user.dart';

class DioClient {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://reqres.in/api';

  Future<User?> getUser(String id) async {
    User? user;

    try {
      Response userData = await _dio.get('$_baseUrl/users/$id');
      print(userData.data.runtimeType);
      user = User.fromMap(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response =
          await _dio.put('$_baseUrl/users/', data: userInfo.toJson());
      print(response.data);

      retrievedUser = UserInfo.fromMap(response.data);
    } catch (e) {
      print('Error Creating user: $e');
    }
    return retrievedUser;
  }

  Future<UserInfo?> updateUser(
      {required UserInfo userInfo, required String id}) async {
    UserInfo? updateUser;

    try {
      Response response =
          await _dio.post('$_baseUrl/users/$id', data: userInfo.toJson());
      print(response.data);

      updateUser = UserInfo.fromMap(response.data);
    } catch (e) {
      print('Error Creating user: $e');
    }
    return updateUser;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete(_baseUrl + '/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
