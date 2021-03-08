import 'dart:convert';

import 'package:project/enums/status-enum.dart';
import 'package:project/models/payment-model.dart';
import 'package:project/models/product-model.dart';
import 'package:project/models/product-model.dart';
List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));
String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.id,
    this.customer,
    this.status,
    this.shipmentPrice,
    this.payment,
    this.address,
    this.orderShip,
    this.orderPrice,
    this.dueDate,
    this.canCancelledUntil,
    this.orderDate,
    this.deliveredDate,
    this.products,
  });

  int id;
  int customer;
  Status status;
  int shipmentPrice;
  Payment payment;
  String address;
  int orderShip;
  double orderPrice;
  DateTime dueDate;
  DateTime canCancelledUntil;
  DateTime orderDate;
  DateTime deliveredDate;
  List<Product> products;

  factory Order.fromJson(Map<String, dynamic> json) {
    Status st;

    return Order(
      id: json["id"],
      customer: json["customer"],
      status: st.getStateType(json["status"]),
      shipmentPrice:
          json["shipmentPrice"] == null ? null : json["shipmentPrice"],
      payment:Payment.fromJson(json["payment"]),
      address: json["address"],
      orderShip: json["orderShip"],
      orderPrice: json["orderPrice"],
      dueDate: DateTime.parse(json["dueDate"]),
      canCancelledUntil: DateTime.parse(json["canCancelledUntil"]),
      orderDate: DateTime.parse(json["orderDate"]),
      deliveredDate: DateTime.parse(json["deliveredDate"]),
      products:
          List<Product>.from(json["products"].map((x) => Product.fromJson(x,))),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer,
        "status": status,
        "shipmentPrice": shipmentPrice == null ? null : shipmentPrice,
        "payment": payment,
        "address": address,
        "orderShip": orderShip,
        "orderPrice": orderPrice,
        "dueDate": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "canCancelledUntil": "${canCancelledUntil.year.toString().padLeft(4, '0')}-${canCancelledUntil.month.toString().padLeft(2, '0')}-${canCancelledUntil.day.toString().padLeft(2, '0')}",
        "orderDate": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        // "deliveredDate": "${deliveredDate.year.toString().padLeft(4, '0')}-${deliveredDate.month.toString().padLeft(2, '0')}-${deliveredDate.day.toString().padLeft(2, '0')}",
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

// class Product {
//   Product({
//     this.id,
//     this.name,
//     this.price,
//     this.description,
//     this.image,
//   });

//   int id;
//   String name;
//   int price;
//   String description;
//   String image;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         description: json["description"],
//         image: json["image"],
//       );
// }

// file of salma




// class Order {
//     Order({
//         this.id,
//         this.customer,
//         this.status,
//         this.shipmentPrice,
//         this.payment,
//         this.address,
//         this.orderShip,
//         this.orderPrice,
//         this.dueDate,
//         this.canCancelledUntil,
//         this.orderDate,
//         // this.deliveredDate,
//         this.products,
//     });

//     int id;
//     int customer;
//     int status;
//     int shipmentPrice;
//     int payment;
//     String address;
//     int orderShip;
//     int orderPrice;
//     DateTime dueDate;
//     DateTime canCancelledUntil;
//     DateTime orderDate;
//     // DateTime deliveredDate;
//     List<Product> products;

//     factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json["id"],
//         customer: json["customer"],
//         status: json["status"],
//         shipmentPrice: json["shipmentPrice"] == null ? null : json["shipmentPrice"],
//         payment: json["payment"],
//         address: json["address"],
//         orderShip: json["orderShip"],
//         orderPrice: json["orderPrice"],
//         dueDate: DateTime.parse(json["dueDate"]),
//         canCancelledUntil: DateTime.parse(json["canCancelledUntil"]),
//         orderDate: DateTime.parse(json["orderDate"]),
//         // deliveredDate: DateTime.parse(json["deliveredDate"]),
//         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x,'en'))),
//     );
// }


