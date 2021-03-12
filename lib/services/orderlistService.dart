import 'package:dio/dio.dart';
import 'package:project/models/order-model.dart';
import '../constants.dart';

class OrderListService {
  String url = (API_URL + "/orders");

  Future<List<Order>> getOrders() async {
    List<Order> orders = [];
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
  Future<List<Order>> getOrdersByUserID(int id) async {
    List<Order> orders = [];
    Response resopnse;
    Dio dio = new Dio();
    resopnse = await dio.get(url+"?customer="+id.toString());
    var data = resopnse.data;
    print(data);
    data.forEach((value) {
      orders.add(Order.fromJson(value));
    });
    return orders;
  }
}
