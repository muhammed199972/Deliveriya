class InfoOrderResponse {
  InfoOrderResponse({
    this.products,
    this.price,
    this.finalPrice,
  });

  List<Product>? products;
  int? price;
  int? finalPrice;

  factory InfoOrderResponse.fromJson(Map<String, dynamic> json) =>
      InfoOrderResponse(
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
        price: json["price"],
        finalPrice: json["finalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "price": price,
        "finalPrice": finalPrice,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.subCategoryId,
    this.carts,
  });

  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? subCategoryId;
  List<Cart>? carts;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        createdAt: DateTime.parse(json["createdAt?"]),
        updatedAt: DateTime.parse(json["updatedAt?"]),
        subCategoryId: json["SubCategoryId"],
        carts: List<Cart>.from(json["Carts"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "price": price,
        "quantity": quantity == null ? null : quantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "SubCategoryId": subCategoryId,
        "Carts": List<dynamic>.from(carts!.map((x) => x.toJson())),
      };
}

class Cart {
  Cart({
    this.id,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.productId,
    this.userId,
  });

  int? id;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productId;
  int? userId;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        productId: json["ProductId"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "ProductId": productId,
        "UserId": userId,
      };
}

class InfoOrderStatus {
  InfoOrderStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory InfoOrderStatus.fromJson(Map<String, dynamic> json) =>
      InfoOrderStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
