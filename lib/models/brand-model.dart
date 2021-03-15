
import 'package:project/services/localizationService.dart';

import 'categoryCollection-model.dart';

class Brand implements Value{
     @override
  String value;
    Brand({
        this.id,
        this.name,
        this.image,
    }):this.value =name;

    int id;
    String name;
    String image;

    factory Brand.fromJson(Map<String, dynamic> json) {
    String lang = LocalizationService().lang; //en
    Map<String, dynamic> langObj = json[lang];
    return Brand(
      id: json["id"],
      name: langObj["name"],
      image: json["image"],
    );
  } 

     @override
    String toString() {
      return "name:${this.name},id:${this.id},image:${this.image},";
    }

}