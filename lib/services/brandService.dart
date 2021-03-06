import 'package:dio/dio.dart';
import 'package:project/models/brand-model.dart';
import 'package:project/models/categoryCollection.dart';

import '../constants.dart';

class BrandService {
  Future<List<Brand>> getAllBrands() async {
    Response response;
    Dio dio = Dio();
    dio.options.headers['accept'] = 'application/json';
    response = await dio.get("$API_URL/$brands");
    if (response.statusCode == 200) {
      print("Brand Service : ");
      // print(response.data.toString());
      // now data is map objects
      var data = response.data;
      return data.map<Brand>((brand) {
        return Brand.fromJson(brand);
      }).toList();

      // or may get like that to get by query parameters
      // response =
      //     await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
      // print(response.data.toString());
    } else {
      print("Brand Service: error in getting data");
    }
  }

  Future<Brand> getBrandById(num id) async {
    Dio dio = Dio();
    Response response = await dio.get("$API_URL/$brands/$id");
    if (response.statusCode == 200) {
      var data = response.data;
      return Brand.fromJson(data);
    } else {
      print("bad response");
    }
  }

  Future<Brand> addNewCategory(Brand brand) async {
    Dio dio = Dio();
    Response res = await dio.post("$API_URL/$brands", data: brand);
    if (res.statusCode == 200) return Brand.fromJson(res.data);
  }

  Future<Brand> deleteBrand(num brandId) async {
    Dio dio = Dio();
    Response res = await dio.post(
      "$API_URL/$brands/$brandId",
    );
    if (res.statusCode == 200) return Brand.fromJson(res.data);
  }
}
