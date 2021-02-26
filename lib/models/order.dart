// // To parse this JSON data, do
// //
// //     final post = postFromJson(jsonString);

// import 'dart:convert';

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

// class Post {
//   Post({
//     this.orders,
//   });

//   List<Order> orders;

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
//       };
// }

// class Order {
//   Order({
//     this.id,
//     this.customer,
//     this.status,
//     this.shipmentPrice,
//     this.payment,
//     this.address,
//     this.orderShip,
//     this.orderPrice,
//     this.dueDate,
//     this.canCancelledUntil,
//     this.orderDate,
//     this.deliveredDate,
//     this.products,
//   });

//   int id;
//   int customer;
//   int status;
//   int shipmentPrice;
//   int payment;
//   String address;
//   int orderShip;
//   int orderPrice;
//   DateTime dueDate;
//   DateTime canCancelledUntil;
//   DateTime orderDate;
//   DateTime deliveredDate;
//   List<Product> products;

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json["id"],
//         customer: json["customer"],
//         status: json["status"],
//         shipmentPrice:
//             json["shipmentPrice"] == null ? null : json["shipmentPrice"],
//         payment: json["payment"],
//         address: json["address"],
//         orderShip: json["orderShip"],
//         orderPrice: json["orderPrice"],
//         dueDate: DateTime.parse(json["dueDate"]),
//         canCancelledUntil: DateTime.parse(json["canCancelledUntil"]),
//         orderDate: DateTime.parse(json["orderDate"]),
//         deliveredDate: DateTime.parse(json["deliveredDate"]),
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "customer": customer,
//         "status": status,
//         "shipmentPrice": shipmentPrice == null ? null : shipmentPrice,
//         "payment": payment,
//         "address": address,
//         "orderShip": orderShip,
//         "orderPrice": orderPrice,
//         "dueDate":
//             "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
//         "canCancelledUntil":
//             "${canCancelledUntil.year.toString().padLeft(4, '0')}-${canCancelledUntil.month.toString().padLeft(2, '0')}-${canCancelledUntil.day.toString().padLeft(2, '0')}",
//         "orderDate":
//             "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
//         "deliveredDate":
//             "${deliveredDate.year.toString().padLeft(4, '0')}-${deliveredDate.month.toString().padLeft(2, '0')}-${deliveredDate.day.toString().padLeft(2, '0')}",
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//       };
// }

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

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "description": description,
//         "image": image,
//       };
// }
class Order {
  Order({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
