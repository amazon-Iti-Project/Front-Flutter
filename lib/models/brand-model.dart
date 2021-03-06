import 'categoryCollection.dart';

class Brand implements Value{
     @override
  String value;
    Brand({
        this.id,
        this.name,
        this.image,
    }):this.value =name;

    int id;
    String name;
    String image;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

     @override
    String toString() {
      // TODO: implement toString
      return "name:${this.name},id:${this.id},image:${this.image},";
    }

}