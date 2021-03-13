import 'package:project/models/shipping-model.dart';
import 'package:project/services/localizationService.dart';
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'fee-model.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x,l) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.id,
        this.categoryName,
        this.name,
        this.rate,
        this.description,
        this.price,
        this.cents,
        this.oldPrice,
        this.quantity,
        this.category,
        this.shippingLabel,
        this.image,
        this.about,
        this.title,
        this.subtitle,
        this.discount,
        this.enObj,
        this.arObj,
        this.shipping,
        this.fee,
        this.size,
        this.color,
        this.tags,
        this.brand,
        this.seller,
    });
    Map<String,dynamic> arObj;
    Map<String,dynamic> enObj;

    int id;
    String categoryName;
    String name;
    int rate;
    String description;
    num price;
    num cents;
    double oldPrice;
    num quantity;
    num category;
    bool shippingLabel;
    String image;
    String about;
    String title;
    String subtitle;
    int discount;
    Shipping shipping;
    Fee fee;
    String size;
    String color;
    List<dynamic> tags;
    num brand;
    num seller; // id

    solve(){
      print(arObj);
      print(enObj);
    }
    factory Product.fromJson(Map<String, dynamic> json,){
      String lang = LocalizationService().lang; //en
      Map<String,dynamic> langObj = json[lang];
      // print(langObj);
      // print("json ar and en");
      // arObj = json['ar'];
      // print(arObj);
      enObj : json['en'];
      // print();
      Map<String,dynamic> shippingObj = json["shipping"];
      Map<String,dynamic> feeObj = json['fee'];
      
      return Product(
        id: json["id"],
        categoryName: json["categoryName"] == null ? null : json["categoryName"],
        name: langObj["name"],
        rate: json["rate"] == null ? null : json["rate"],
        enObj: json['en'],
        arObj: json['ar'],
        // as follow
        // description: langJson["description"] == null ? null : langJson["description"],
        description: langObj["description"] == null ? null : langObj["description"],
        price: json["price"],
        cents: json["cents"] == null ? null : json["cents"],
        oldPrice: json["oldPrice"] == null ? null : json["oldPrice"].toDouble(),
        quantity: json["quantity"],
        category: json["category"],
        shippingLabel: json["shippingLabel"] == null ? null : json["shippingLabel"],
        image: json["image"],
        about: langObj["about"] == null ? null : langObj["about"],
        title: langObj["title"] == null ? null : langObj["title"],
        subtitle: langObj["subtitle"] == null ? null : langObj["subtitle"],
        discount: json["discount"] == null ? 5 : json["discount"],
        shipping: Shipping.fromJson(shippingObj),
        fee: Fee.fromJson(feeObj),
        size: langObj["size"],
        color: langObj["color"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        brand: json["brand"] == null ? null : json["brand"],
    );
    }
    Map<String, dynamic> toJson() => {

        "id": id,
        "categoryName": categoryName == null ? null : categoryName,
        "name": name,
        "rating": rate == null ? null : rate,
        "description": description == null ? null : description,
        "price": price,
        "cents": cents == null ? null : cents,
        "oldPrice": oldPrice == null ? null : oldPrice,
        "quantity": quantity,
        "category": category,
        "shippingLabel": shippingLabel == null ? null : shippingLabel,
        "image": image,
        "about": about == null ? null : about,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "discount": discount,
        "ar":arObj,
        "en":enObj,
        "shipping": shipping.toJson(),
        "fee": fee.toJson(),
        "size": size,
        "color": color,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand == null ? null : brand,
    };
        @override
    String toString() {
      // TODO: implement toString
      return "name:${this.name},id:${this.id},price:${this.price},category:${this.category},"
      +"fee:${this.fee},discount:${this.discount},shipping:${this.shipping},color:${this.color},";
    }
}
// import 'package:project/models/shipping-model.dart';
// import 'package:project/services/localizationService.dart';
// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';

// import 'fee-model.dart';

// List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x,l) => Product.fromJson(x)));

// String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//     Product({
//         this.id,
//         this.categoryName,
//         this.rate,
//         this.price,
//         this.cents,
//         this.oldPrice,
//         this.quantity,
//         this.category,
//         this.shippingLabel,
//         this.image,
//         this.discount,
//         this.en,
//         this.ar,
//         this.shipping,
//         this.fee,
//         this.tags,
//         this.brand,
//         this.seller,
//     });

//     int id;
//     String categoryName;
//     int rate;
//     num price;
//     num cents;
//     double oldPrice;
//     num quantity;
//     num category;
//     bool shippingLabel;
//     String image;
//     int discount;
//     Lang en;
//     Lang ar;
//     Shipping shipping;
//     Fee fee;
//     List<dynamic> tags;
//     num brand;
//     num seller; // id

//     Map<String, dynamic> arToJson() => {
//         "name": name,
//         "description": description == null ? null : description,
//         "about": about == null ? null : about,
//         "title": title == null ? null : title,
//         "subtitle": subtitle == null ? null : subtitle,
//         "size": size,
//         "color": color,
//       };
    
//     factory Product.fromJson(Map<String, dynamic> json,){
//       String lang = LocalizationService().lang;
//       Map<String,dynamic> langObj = json[lang];
//       Map<String,dynamic> arObj = json['ar'];
//       Map<String,dynamic> enObj = json['en'];

//       Map<String,dynamic> shippingObj = json["shipping"];
//       Map<String,dynamic> feeObj = json['fee'];
//       return Product(
//         id: json["id"],
//         categoryName: json["categoryName"] == null ? null : json["categoryName"],
//         rate: json["rate"] == null ? null : json["rate"],
//         // as follow
//         // description: langJson["description"] == null ? null : langJson["description"],
//         price: json["price"],
//         cents: json["cents"] == null ? null : json["cents"],
//         oldPrice: json["oldPrice"] == null ? null : json["oldPrice"].toDouble(),
//         quantity: json["quantity"],
//         category: json["category"],
//         shippingLabel: json["shippingLabel"] == null ? null : json["shippingLabel"],
//         image: json["image"],
//         discount: json["discount"] == null ? 5 : json["discount"],
//         ar: Lang.fromJson(arObj),
//         en: Lang.fromJson(enObj),
//         shipping: Shipping.fromJson(shippingObj),
//         fee: Fee.fromJson(feeObj),
//         tags: List<dynamic>.from(json["tags"].map((x) => x)),
//         brand: json["brand"] == null ? null : json["brand"],
//     );
//     }

    // Map<String, dynamic> toJson() => {

    //     "id": id,
    //     "categoryName": categoryName == null ? null : categoryName,
    //     "rating": rate == null ? null : rate,
    //     "price": price,
    //     "cents": cents == null ? null : cents,
    //     "oldPrice": oldPrice == null ? null : oldPrice,
    //     "quantity": quantity,
    //     "category": category,
    //     "shippingLabel": shippingLabel == null ? null : shippingLabel,
    //     "image": image,
    //     "discount": discount,
    //     "en":en.toJson(),
    //     "ar":this.LangJson(),
    //     "shipping": shipping.toJson(),
    //     "fee": fee.toJson(),
    //     "tags": List<dynamic>.from(tags.map((x) => x)),
    //     "brand": brand == null ? null : brand,
    // };
//         @override
//     String toString() {
//       // TODO: implement toString
//       // return "name:${this.name},id:${this.id},price:${this.price},category:${this.category},"
//       // +"fee:${this.fee},discount:${this.discount},shipping:${this.shipping},color:${this.color},";
//     }
// }

// class Lang {
//   Lang({
//     this.name,
//     this.description,
//     this.about,
//     this.title,
//     this.subtitle,
//     this.size,
//     this.color
//   });
//   String name;
//   String description;
//   String about;
//   String title;
//   String subtitle;
//   String size;
//   String color;

//   factory Lang.fromJson(Map<String, dynamic> json) => Lang(
//         name: json["name"],
//         description: json["description"] == null ? null : json["description"],
//         about: json["about"] == null ? null : json["about"],
//         title: json["title"] == null ? null : json["title"],
//         subtitle: json["subtitle"] == null ? null : json["subtitle"],
//         size: json["size"],
//         color: json["color"]
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "description": description == null ? null : description,
//         "about": about == null ? null : about,
//         "title": title == null ? null : title,
//         "subtitle": subtitle == null ? null : subtitle,
//         "size": size,
//         "color": color,
//       };
// }
