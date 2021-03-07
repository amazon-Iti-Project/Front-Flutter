
class Fee {
  Fee({this.id,this.admin, this.category, this.fee,/* this.state*/});
  num id;
  int admin;
  int category;
  int fee;
  // Orders state;

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        id: json["id"],
        admin: json["admin"],
        category: json["category"],
        fee: json["fee"],
        // state: .getOrderType(json["discount"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin": admin,
        "category": category,
        "fee": fee,
      };
}
