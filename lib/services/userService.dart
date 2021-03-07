import 'package:dio/dio.dart';
import 'package:project/models/user-model.dart';

import '../constants.dart';

class UserService {
  Future<User> getUserByToken(String token) async {
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get(API_URL + "/users?token="+token);
    var _user = (response.data as List<dynamic>).firstWhere((ele) => true);
    return User.fromJson(_user);
  }
}