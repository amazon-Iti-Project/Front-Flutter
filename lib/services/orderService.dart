import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project/models/order.dart';

import '../constants.dart';

class OrderService {
  Future CreateNewOrder(Order myOrder) async {
    Response response;
    Dio dio = new Dio();
    response =
        await dio.post(API_URL + "/orders",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode(myOrder),
        );
  }
}