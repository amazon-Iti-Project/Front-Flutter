import 'package:project/models/order-model.dart';
import 'package:project/models/payment-model.dart';
import 'package:dio/dio.dart';
import 'package:project/models/user-model.dart';

import '../constants.dart';

class PaymentService {
  User user;
  Future<List<Order>> getPaymentByUserID(int id) async {
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get(API_URL + "/orders?customer=" + user.id.toString());
    var list = (response.data as List<dynamic>);
    return list.map<Order>((orde) => Order.fromJson(orde)).toList();
  }
}
