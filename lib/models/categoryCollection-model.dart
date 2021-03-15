// To parse this JSON data, do
//
//     final categoriesCollection = categoriesCollectionFromJson(jsonString);
import 'package:project/services/localizationService.dart';

class CategoryCollection {
    CategoryCollection({
        this.title,
        this.data,
    });

    String title;
    List<Datum> data;

    factory CategoryCollection.fromJson(Map<String, dynamic> json){
      String lang = LocalizationService().lang; //en
      Map<String,dynamic> titleObj = json["title"];
      return CategoryCollection(
        title: titleObj[lang],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
      );
    }
}

class Datum implements Value{
    Datum({
        this.id,
        this.name,
        this.image,
    }):this.value=name;
    int id;
    String name;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json){
      String lang = LocalizationService().lang; //en
      Map<String,dynamic> langObj = json[lang];
      return Datum(
        id: json["id"],
        name: langObj["name"],
        image: json["image"],
      );
    }

  @override
  String value;
}

class Value {
  String value;
  Value(this.value);
}

//CategoryCollection

// class CategoryCollection {
//     CategoryCollection({
//         this.title,
//         this.data,
//     });

//     String title;
//     List<Datum> data;

//     factory CategoryCollection.fromJson(Map<String, dynamic> json) => CategoryCollection(
//         title: json["title"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );
// }

// class Datum implements Value {
//     @override
//   String value;
//     Datum({
//         this.id,
//         this.name,
//         this.image,
//     }):this.value =name;

//     int id;
//     String name;
//     String image;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//     );

//      @override
//     String toString() {
//       // TODO: implement toString
//       return "name:${this.name},id:${this.id},image:${this.image},";
//     }


// }

// class Value {
//   String value;
//   Value(this.value);
// }
