import 'package:project/models/shipping-model.dart';
import 'package:project/screens/seller/addProduct/addProduct.dart';
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'fee-model.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

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
        this.shipping,
        this.fee,
        this.size,
        this.color,
        this.tags,
        this.brand,
        this.seller,
    });

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
    factory Product.fromJson(Map<String, dynamic> json,/*String lang*/){
      //1- get language
      //String lang = getLang() //shared prefrence ;
      //2- get language object
      Map<String,dynamic> langObj = json['en'];
      Map<String,dynamic> shippingObj = json["shipping"];
      Map<String,dynamic> feeObj = json['fee'];

      //3- set product attributes by lang attributes
      // {id,image,...ar}
      print("in product json parsing");
      // print(json.decoded);
      return Product(
        id: json["id"],
        categoryName: json["categoryName"] == null ? null : json["categoryName"],
        name: langObj["name"],
        rate: json["rate"] == null ? null : json["rate"],
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
        discount: json["discount"],
        shipping: Shipping.fromJson(json["shipping"]),
        fee: Fee.fromJson(json["fee"]),
        size: json["size"],
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


//option1
// Products{
// "ar":{
//     [products ar]
// },
// "en":{
//     [products en]
// }
// }
// //option2
// Products[{
//   data:image,id,
//       ar:{name,desc,about,tags},
//       en:{name,desc,about,tags}
//       }
//   }
    
// ]