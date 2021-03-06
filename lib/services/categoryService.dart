import 'package:dio/dio.dart';
import 'package:project/models/categoryCollection-model.dart';

import '../constants.dart';

class CategoryService  {

 Future<List<Datum>> getAllCategories()async{
      Response response;
      Dio dio =  Dio();
  dio.options.headers['accept'] = 'application/json';
  response = await dio.get("$API_URL/$categories");
  if (response.statusCode == 200){
  print("response by CategoryService : ");
  // print(response.data.toString());
  // now data is map objects
  var data = response.data;
    return data.map<Datum>((category){
     return   Datum.fromJson(category);
    }
    ).toList();

  // or may get like that to get by query parameters
  // response =
  //     await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
  // print(response.data.toString());
  }else{
    print("Category Service: error in getting data");
  }
  }

  Future<Datum> getCategoryById(num id) async{
      
      Dio dio = Dio();
     Response response = await dio.get("$API_URL/$categories/$id");
    if (response.statusCode == 200){
      var data = response.data;
      return Datum.fromJson(data);
    }else{
      print("bad response");
    }

  }

  Future<Datum> addNewCategory(Datum category)async{

    Dio dio = Dio();
    Response res = await dio.post("$API_URL/$categories",data:category);
    if(res.statusCode == 200)
    return Datum.fromJson(res.data);
  }

Future<Datum> deleteCategory(num catId)async{
    Dio dio = Dio();
    Response res = await dio.post("$API_URL/$categories/$catId",);
    if(res.statusCode == 200)
    return Datum.fromJson(res.data);
}

}