class CartResponse {
  CartResponse({
    this.data,
    this.totlaPrice,
  });

  List<Data>? data;
  int? totlaPrice;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        totlaPrice: json["totlaPrice"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "totlaPrice": totlaPrice,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.arName,
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
  String? arName;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? subCategoryId;
  List<Cart>? carts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        arName: json["ar_name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subCategoryId: json["SubCategoryId"],
        carts: List<Cart>.from(json["Carts"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ar_name": arName,
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
  });

  int? id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
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
