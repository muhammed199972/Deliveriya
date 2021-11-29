// To parse this JSON data, do
//
//     final productsProductsStatus = productsProductsStatusFromJson(jsonString);

class ProductsResponse {
  ProductsResponse({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.subCategoryId,
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

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subCategoryId: json["SubCategoryId"],
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
      };
}

class ProductsStatus {
  ProductsStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory ProductsStatus.fromJson(Map<String, dynamic> json) => ProductsStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
