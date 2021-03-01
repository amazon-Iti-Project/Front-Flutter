class Product {
  String id;
  String name;
  String color;
  Product({this.name, this.color, this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      color: json['color'],
    );
  }
}
