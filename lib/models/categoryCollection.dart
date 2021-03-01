class CategoryCollection {
    CategoryCollection({
        this.title,
        this.data,
    });

    String title;
    List<Datum> data;

    factory CategoryCollection.fromJson(Map<String, dynamic> json) => CategoryCollection(
        title: json["title"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.image,
    });

    int id;
    String name;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );
}
