import 'package:dio/dio.dart';
import 'package:project/models/fee-model.dart';

import '../constants.dart';

class FeeService {
  Future<Fee> getFeebyCatId(num catId) async {
    Dio dio = Dio();
    dio.options.headers['accept'] = 'application/json';
    Response response =
        await dio.get("$API_URL/$fees?category=$catId&category=0");
    if (response.statusCode == 200) {
      print("response feeService : 200 ");
      List<Fee> list = (response.data as List<dynamic>).map<Fee>((item)=>
      Fee.fromJson(item))
      .toList();
        print("feeFromJson: ${list.length}");

      var fee;
      if (list.length > 1) {
         fee =
            list.firstWhere((item) => item.category != 0);
      }else{
     fee =
            list.firstWhere((item) => item.category == 0);
      }

      return fee;
    } else {
      print("Category Service: error in getting data");
    }
  }

  Future<Fee> getFeeById(num id) async {
    Dio dio = Dio();
    Response response = await dio.get("$API_URL/$fees/$id");
    if (response.statusCode == 200) {
      var data = response.data;
      return Fee.fromJson(data);
    } else {
      print("bad response");
    }
  }
}
