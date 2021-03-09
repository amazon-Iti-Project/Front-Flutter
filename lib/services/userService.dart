import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "package:flutter_guid/flutter_guid.dart";
import 'package:project/models/user-model.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/services/localizationService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class UserService {
  // Future<User> getUserByToken(String token) async {
  //   Response response;
  //   Dio dio = new Dio();
  //   response =
  //       await dio.get(API_URL + "/users?token="+token);
  //   var _user = (response.data as List<dynamic>).firstWhere((ele) => true);
  //   return User.fromJson(_user);
  // }

  Future<List<User>> getAllUsers() async {
    Dio dio = Dio();
    Response res = await dio.get(API_URL + "/users");
    if (res.statusCode == 200) {
      var users = res.data as List<dynamic>;
      return users.map((user) => User.fromJson(user));
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
      return null;
    }
  }

  Future<User> addNewUser(User user) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res = await dio.post(API_URL + "/users", data: user.toJson());
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
      return null;
    }
  }

  //1-to get the user from db.json  in login page after submit
  Future<User> getUserByNameAndPassword(User user) async {
    Dio dio = Dio();
    Response res = await dio.get(
        API_URL + "/users?username=${user.name}&password=${user.password}");
    if (res.statusCode == 200) {
      var users = res.data as List<dynamic>;
      if (users.length == 1) {
        User matchedUser =
            User.fromJson(users.firstWhere((user) => user != null));
        return matchedUser;
      } else
        return null;
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
    }
    return null;
  }

  Future<User> getUserById(User user) async {
    Dio dio = Dio();
    Response res = await dio.get(API_URL + "/users/${user.id}");
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
    }
    return null;
  }

  //2- if a user create a token in local storage
  Future<String> createTokenbyUserId(User user) async {
    Guid token = Guid.newGuid;
    print("generated token is :${token.value}");
    await LocalizationService().prefs.setString("UserToken", token.value);
    return token.value;
  }

  //3- add token to user in db
  Future<User> updateUserToken(User user, String token) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res = await dio
        .patch(API_URL + "/users/${user.id}", data: {"token": user.token});
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
      return null;
    }
  }

  //4- to get user token //1- in any page to get current user use this method first
  Future<String> isUserSignedIn() async {
    SharedPreferences prefs =
        await LocalizationService().getSharedPreferences();
    String token = prefs.getString('UserToken');
    return token;
  }

//5- if user get user by token  // 2- in any page if user logged use this method
  Future<User> getUserByToken(String token) async {
    Dio dio = Dio();
    Response res = await dio.get(API_URL + "/users?token=$token");
    if (res.statusCode == 200) {
      var users = res.data as List<dynamic>;
      User matchedUser =
          User.fromJson(users.firstWhere((user) => user != null));
      return matchedUser;
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
    }
    return null;
  }

  // add to cart
  // steps to add to cart
  // 1- get the user and on click add to cart send user and productId tp addTpCart method
  Future<User> addToCart(User user, num productId) async {
    var cart = user.cart;
    cart.add(productId);
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res =
        await dio.patch(API_URL + "/users/${user.id}", data: {"cart": cart});
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
      return null;
    }
  }

  Future<List<num>> getUserCart(User user) async {
    Dio dio = Dio();
    Response res = await dio.get(API_URL + "users/${user.id}");
    if (res.statusCode == 200) {
      return User.fromJson(res.data).cart;
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
    }
    return null;
  }
  // this.getUserByToken(token).subscribe( res=>{
  // },err =>console.log(err))

  // in log out remove user token
  Future<User> deleteTokenByUserId(User user) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res =
        await dio.patch(API_URL + "/users/${user.id}", data: {"token": null});
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      AlertDialog(
        content: AppText(res.statusMessage),
      );
      return null;
    }
  }

  // reomve from local storage
  Future<bool> logOutUser() async {
    SharedPreferences prefs =
        await LocalizationService().getSharedPreferences();
    return await prefs.remove('UserToken');
  }
}
