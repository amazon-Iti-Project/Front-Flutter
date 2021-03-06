import 'package:project/models/fee-model.dart';
import 'package:project/models/shipping-model.dart';

class Product {
   num id;
  String name;
  String image;
  String description;
  List<String> tags;
  String color;
  String size;
  num price;
  Shipping shipping; 
  Fee fee; 
  num discount;
  num quantity;
  num brand;
  num category; // category id
  num rate;  // rate id
  ///////// from IProduct //////
  // cents : number,
  // oldPrice : number,
  num stock;
  bool shippingLabel;
  num seller;
  Product({this.id,this.name, this.color,this.image,this.description,this.tags,this.size,this.price,this.shipping,
   this.fee,this.discount,this.quantity,this.brand,this.category,this.rate,this.stock,this.shippingLabel,this.seller,});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], name: json['name'], color: json['color'], image:json['image'],
      description:json['description'], tags:json['tags'],size:json['size'],
      shipping:json['shipping'], fee:json['fee'], discount:json['discount'],
      quantity:json['quantity'], brand:json['brand'], category:json['category'],
      rate:json['rate'], stock:json['stock'],shippingLabel:json['shippingLabel'], seller:json['seller'],
    );
  }

  @override
    String toString() {
      // TODO: implement toString
      return "name:${this.name},id:${this.id},price:${this.price},category:${this.category},"
      +"fee:${this.fee},discount:${this.discount},shipping:${this.shipping},color:${this.color},";
    }
}