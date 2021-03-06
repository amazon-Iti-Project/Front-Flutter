
class Shipping {
  Shipping({
    this.period,
    this.shipPrice,
  });
  num id;
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
