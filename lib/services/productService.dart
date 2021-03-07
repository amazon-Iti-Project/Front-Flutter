import 'package:dio/dio.dart';
import 'package:project/models/product-model.dart';
import '../constants.dart';

class ProductService {
  Future<List<Product>> getProductsByCatID(String name,String code) async {
    List<Product> products = new List();
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get(API_URL + "/products?categoryName=" + name.toLowerCase());
    var data = response.data;
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i],code));
    }
    return products;
  }

  Future<List<Product>> getProductListByID(List<int> items,String code) async {
    List<Product> products = new List();
    var strItems = items.map((id) => "id=" + id.toString());
    var query = strItems.join('&');
    Response response;
    Dio dio = new Dio();

    response = await dio.get(API_URL + "/products?" + query);
    var data = response.data;
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i],code));
    }
    return products;
  }

  Future<Product> getProductByID(int id,String code) async {
    Product product;
    Response response;
    Dio dio = new Dio();

    response = await dio.get(API_URL + "/products/" + id.toString());
    var data = response.data;
    product = Product.fromJson(data,code);

    return product;
  }

  Future<List<Product>> getProductsBySellerId(num id,String code) async{
    Dio dio = Dio();
    Response res = await dio.get(API_URL+"/products?seller=$id");
    var list = (res.data as List<dynamic>);
    return list.map<Product>(
      (prod)=>Product.fromJson(prod,code)
    ).toList(); 
  }

      fromJson(Map<String, dynamic> json) {
        var name= json["name"];
        var desc= json["name"];
      }

   //   object.decode
}
