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
}

class Fee {
    Fee({
        this.admin,
        this.category,
        this.fee,
    });

    int admin;
    int category;
    int fee;

    factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        admin: json["admin"],
        category: json["category"],
        fee: json["fee"],
    );
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
}
