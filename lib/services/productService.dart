import 'package:dio/dio.dart';
import 'package:project/models/product-model.dart';
import '../constants.dart';

class ProductService {
  Future<List<Product>> getProductsByCatID(int id) async {
    List<Product> products = [];
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get(API_URL + "/products?category=" + id.toString());
    var data = response.data;
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }
    return products;
  }

  Future<List<Product>> getProductListByID(List<int> items) async {
    if(items == null || items.length == 0)
      return [];
    List<Product> products = [];
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

  Future<List<Product>> getProductsBySellerId(num id) async{
    Dio dio = Dio();
    Response res = await dio.get(API_URL+"/products?seller=$id");
    var list = (res.data as List<dynamic>);
    return list.map<Product>(
      (prod)=>Product.fromJson(prod)
    ).toList(); 
  }

  Future<Product> addNewProduct(Product product) async{
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response res = await dio.post(API_URL + "/products", data: product.toJson());
    return(Product.fromJson(res.data));
  }
}
