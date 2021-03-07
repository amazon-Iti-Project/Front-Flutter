import 'package:dio/dio.dart';
import 'package:project/models/order-model.dart';
import '../constants.dart';
import 'package:project/enums/status-enum.dart';

class OrderListService {
  String url = (API_URL + "/orders");

  Future<List<Order>> getOrders() async {
    List<Order> orders = new List();
    Response resopnse;
    Dio dio = new Dio();
    resopnse = await dio.get(url);
    var data = resopnse.data;
    print(data);
    data.forEach((value) {
      orders.add(Order.fromJson(value));
    });
    return orders;
  }
}
