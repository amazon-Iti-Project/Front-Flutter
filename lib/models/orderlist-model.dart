enum Status { pending, arriving, delivered, archived, cancelled, cancelling }

extension StatusExt on Status {
  num get value {
    switch (this) {
      case Status.pending:
        return 1;
      case Status.arriving:
        return 2;
      case Status.delivered:
        return 3;
      case Status.archived:
        return 4;
      case Status.cancelled:
        return 5;
      case Status.cancelling:
        return 6;
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case Status.pending:
        return "Pending";
      case Status.arriving:
        return "Arriving";
      case Status.delivered:
        return "Delivered";
      case Status.archived:
        return "Archived";
      case Status.cancelled:
        return "Cancelled";
      case Status.cancelling:
        return "Cancelling";
      default:
        return null;
    }
  }

  Status getStateType(num state) {
    switch (state) {
      case 1:
        return Status.pending;
      case 2:
        return Status.arriving;
      case 3:
        return Status.delivered;
      case 4:
        return Status.archived;
      case 5:
        return Status.cancelled;
      case 6:
        return Status.cancelling;
      default:
        return null;
    }
  }
}

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
  int payment;
  String address;
  int orderShip;
  int orderPrice;
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
      payment: json["payment"],
      address: json["address"],
      orderShip: json["orderShip"],
      orderPrice: json["orderPrice"],
      dueDate: DateTime.parse(json["dueDate"]),
      canCancelledUntil: DateTime.parse(json["canCancelledUntil"]),
      orderDate: DateTime.parse(json["orderDate"]),
      deliveredDate: DateTime.parse(json["deliveredDate"]),
      products:
          List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.image,
  });

  int id;
  String name;
  int price;
  String description;
  String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );
}
