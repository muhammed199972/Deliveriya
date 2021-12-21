class CartResponse {
  int? id;
  String? name;
  String? icon;
  String? avatar;
  List<SubCategories> subCategories = [];

  CartResponse(
      {this.id,
      this.name,
      this.icon,
      this.avatar,
      required this.subCategories});

  CartResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    avatar = json['avatar'];
    if (json['SubCategories'] != null) {
      json['SubCategories'].forEach((v) {
        subCategories.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['avatar'] = this.avatar;
    if (this.subCategories != null) {
      data['SubCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? icon;
  String? avatar;
  List<Products> products = [];

  SubCategories(
      {this.id, this.name, this.icon, this.avatar, required this.products});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    avatar = json['avatar'];
    if (json['Products'] != null) {
      json['Products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['avatar'] = this.avatar;
    if (this.products != null) {
      data['Products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  List<Carts> Cartid = [];

  Products(
      {this.id,
      this.name,
      this.type,
      this.avatar,
      this.price,
      this.quantity,
      required this.Cartid});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    avatar = json['avatar'];
    price = json['price'];
    quantity = json['quantity'];
    if (json['Carts'] != null) {
      json['Carts'].forEach((v) {
        Cartid.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    if (this.Cartid != null) {
      data['Carts'] = this.Cartid.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? id;
  int? quantity;
  Carts({this.id});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}

class CartStatus {
  CartStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory CartStatus.fromJson(Map<String, dynamic> json) => CartStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
