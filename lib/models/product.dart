import 'package:project/screens/seller/addProduct/addProduct.dart';
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.id,
        this.categoryName,
        this.name,
        this.rating,
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
    });

    int id;
    String categoryName;
    String name;
    int rating;
    String description;
    int price;
    int cents;
    double oldPrice;
    int quantity;
    String category;
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
    String brand;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryName: json["categoryName"] == null ? null : json["categoryName"],
        name: json["name"],
        rating: json["rating"] == null ? null : json["rating"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"],
        cents: json["cents"] == null ? null : json["cents"],
        oldPrice: json["oldPrice"] == null ? null : json["oldPrice"].toDouble(),
        quantity: json["quantity"],
        category: json["category"],
        shippingLabel: json["shippingLabel"] == null ? null : json["shippingLabel"],
        image: json["image"],
        about: json["about"] == null ? null : json["about"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        discount: json["discount"],
        shipping: Shipping.fromJson(json["shipping"]),
        fee: Fee.fromJson(json["fee"]),
        size: json["size"],
        color: json["color"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        brand: json["brand"] == null ? null : json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName == null ? null : categoryName,
        "name": name,
        "rating": rating == null ? null : rating,
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
}

class Fee {
    Fee({
        this.admin,
        this.category,
        this.fee,
        this.state
    });

    int admin;
    int category;
    int fee;
    Orders state;

    factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        admin: json["admin"],
        category: json["category"],
        fee: json["fee"],
        // state: .getOrderType(json["discount"]),

    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "category": category,
        "fee": fee,
    };
}

class Shipping {
    Shipping({
        this.period,
        this.shipPrice,
    });

    int period;
    int shipPrice;

    factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        period: json["period"],
        shipPrice: json["shipPrice"],
    );

    Map<String, dynamic> toJson() => {
        "period": period,
        "shipPrice": shipPrice,
    };
}