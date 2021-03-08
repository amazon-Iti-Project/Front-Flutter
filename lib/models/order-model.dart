
import 'package:project/enums/status-enum.dart';
import 'package:project/models/payment-model.dart';
import 'package:project/models/product-model.dart';
import 'package:project/services/localizationService.dart';
import 'dart:convert';
// String orderTojsonOrder(Order data) => jsonOrder.encode(data.tojsonOrder());

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
  num orderPrice;
  DateTime dueDate;
  DateTime canCancelledUntil;
  DateTime orderDate;
  DateTime deliveredDate;
  List<Product> products;

  factory Order.fromJson(Map<String, dynamic> jsonOrder) {
    Status st;
    String lang = LocalizationService().lang;
    var arjsonOrder = jsonOrder[lang];
    var enjsonOrder = jsonOrder[lang];
    List<dynamic> prodList = jsonOrder["products"] as List<dynamic>;
    // print("en:$enjsonOrder");
    print("prodList: $prodList");
    print("dueDate: ${jsonOrder["dueDate"]}");
    print("canCancelledUntil: ${jsonOrder["canCancelledUntil"]}");
    // var 
    return Order(
      id: jsonOrder["id"],
      customer: jsonOrder["customer"],
      status: st.getStateType(jsonOrder["status"]),
      shipmentPrice:
          jsonOrder["shipmentPrice"] == null ? null : jsonOrder["shipmentPrice"],
      payment:Payment.fromJson(jsonOrder["payment"]),
      address: jsonOrder["address"],
      orderShip: jsonOrder["orderShip"],
      orderPrice: jsonOrder["orderPrice"],
      dueDate: DateTime.parse(jsonOrder["dueDate"]),
      canCancelledUntil: DateTime.parse(jsonOrder["canCancelledUntil"]),
      orderDate: DateTime.parse((jsonOrder["orderDate"]as String).toLowerCase().trim()),
      deliveredDate: DateTime.parse((jsonOrder["deliveredDate"] as String).toLowerCase().trim()),
      products: 
          prodList.map<Product>((prod) => Product.fromJson(prod)).toList(),
          // List<Product>.from(prodList).map<Product>((prod) => Product.fromJson(prod)).toList(),
          // .map<Product>((prod) => Product.fromJson(prod)).toList(),
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

//   factory Product.fromjsonOrder(Map<String, dynamic> jsonOrder) => Product(
//         id: jsonOrder["id"],
//         name: jsonOrder["name"],
//         price: jsonOrder["price"],
//         description: jsonOrder["description"],
//         image: jsonOrder["image"],
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

//     factory Order.fromjsonOrder(Map<String, dynamic> jsonOrder) => Order(
//         id: jsonOrder["id"],
//         customer: jsonOrder["customer"],
//         status: jsonOrder["status"],
//         shipmentPrice: jsonOrder["shipmentPrice"] == null ? null : jsonOrder["shipmentPrice"],
//         payment: jsonOrder["payment"],
//         address: jsonOrder["address"],
//         orderShip: jsonOrder["orderShip"],
//         orderPrice: jsonOrder["orderPrice"],
//         dueDate: DateTime.parse(jsonOrder["dueDate"]),
//         canCancelledUntil: DateTime.parse(jsonOrder["canCancelledUntil"]),
//         orderDate: DateTime.parse(jsonOrder["orderDate"]),
//         // deliveredDate: DateTime.parse(jsonOrder["deliveredDate"]),
//         products: List<Product>.from(jsonOrder["products"].map((x) => Product.fromjsonOrder(x,'en'))),
//     );
// }


