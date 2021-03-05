class Fee {
  num id;
  num fee;
  String admin;
  num category;

    Fee({this.id,this.admin, this.category,this.fee});
   

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      id: json['id'],
      fee: json['fee'],
      admin:json['admin'],
      category:json['category'],
    );
  }
}
