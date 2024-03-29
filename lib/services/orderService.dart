import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project/models/order-model.dart';
import 'package:project/models/user-model.dart';

import '../constants.dart';

class OrderService {
  Future<Order> CreateNewOrder(Order myOrder) async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res = await dio.post(API_URL + "/orders", data: myOrder.toJson());
    return(Order.fromJson(res.data));
  }
  Future<List<Order>> getOrders() async {
    List<Order> orders = [];
    Response resopnse;
    Dio dio = new Dio();
    resopnse = await dio.get(API_URL+"/orders");
    var data = resopnse.data;
    data.forEach((value) {
      orders.add(Order.fromJson(value));
    });
    return orders;
  }

  Future<List<Order>> getPendingOrders() async{
      Dio dio = Dio();
      Response res = await dio.get(API_URL + "/orders?status=1",);
      print("fetching in order service");
      if(res.statusCode == 200){
        print("success request");
        var list = res.data  as  List<dynamic>;
        print(list[0]["products"][0] is Map);
        return list.map(
          (order)=>Order.fromJson(order)
        ).toList();
      }else{
            print(res.statusMessage) ;
      }
  }
    Future<List<Order>> getDeliveredOrders() async{
      Dio dio = Dio();
      Response res = await dio.get(API_URL + "/orders?status=3",);
      if(res.statusCode == 200){
        var list = res.data  as  List<dynamic>;
        return list.map(
          (order)=>Order.fromJson(order)
        ).toList();
      }else{
            print(res.statusMessage) ;
      }
  }

  Future<User> removeCartItems(int id) async{
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res = await dio.patch(API_URL+"/users/"+id.toString(),
      data: {"cart":[]} 
    );
  }
  
//   export enum DELIVERY_STATE{
//     Pending = 1,
//     Arriving = 2,
//     Delivered = 3,
//     Archived = 4,
//     Cancelled = 5,
//     Cancelling = 6,
// }

}