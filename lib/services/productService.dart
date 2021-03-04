import '../models/product.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class ProductService {
  Future<List<Product>> getProductsByCatID(String name) async {
    List<Product> products = new List();
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get(API_URL + "/products?categoryName=" + name.toLowerCase());
    var data = response.data;
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }
    return products;
  }

  Future<List<Product>> getProductListByID(List<int> items) async {
    List<Product> products = new List();
    var strItems = items.map((id) => "id=" + id.toString());
    var query = strItems.join('&');
    Response response;
    Dio dio = new Dio();

    response = await dio.get(API_URL + "/products?" + query);
    var data = response.data;
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }
    return products;
  }

  Future<Product> getProductByID(int id) async {
    Product product;
    Response response;
    Dio dio = new Dio();

    response = await dio.get(API_URL + "/products/" + id.toString());
    var data = response.data;
    product = Product.fromJson(data);

    return product;
  }
}
