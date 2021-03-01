class Shipping {

  num id;
  num period;
  num shipPrice;

    Shipping({this.id,this.period, this.shipPrice});
   

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      id: json['id'],
      period: json['period'],
      shipPrice:json['shipPrice'],
    );
  }
}