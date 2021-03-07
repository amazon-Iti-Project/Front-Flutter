class User {
    User({
        this.name,
        this.username,
        this.password,
        this.id,
        this.token,
        this.cart,
        this.repassword,
    });

    String name;
    String username;
    String password;
    int id;
    String token;
    List<int> cart;
    String repassword;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        username: json["username"],
        password: json["password"],
        id: json["id"],
        token: json["token"] == null ? null : json["token"],
        cart: json["cart"] == null ? null : List<int>.from(json["cart"].map((x) => x)),
        repassword: json["repassword"] == null ? null : json["repassword"],
    );

    Map<String,dynamic> toJson()=> {
      "name":this.name ,"username":this.username,"password":this.password,"token":this.token
      };
}
