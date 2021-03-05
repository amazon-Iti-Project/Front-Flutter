import 'package:dio/dio.dart';
import 'package:project/screens/customer/order/order.dart';

class OrderService {
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Order>> getOrders() async {
    List<Order> orders = new List();
    Response resopnse;
    Dio dio = new Dio();
    resopnse = await dio.get(url);
    var data = resopnse.data;
    // print(data);
    data.forEach((value) {
      orders.add(Order.fromJson(value));
    });
    return orders;
  }
}
