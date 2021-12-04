// To parse this JSON data, do
//
//     final productsProductsStatus = productsProductsStatusFromJson(jsonString);

class ProductsResponse {
  ProductsResponse(
      {this.id,
      this.name,
      this.type,
      this.avatar,
      this.price,
      this.quantity,
      this.subCategoryId,
      this.favorites,
      this.carts});

  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  int? subCategoryId;
  List? favorites;
  List? carts;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        subCategoryId: json["SubCategoryId"],
        favorites: json['Favorites'] == null ? null : json['Favorites'],
        carts: json['Carts'] == null ? null : json['Carts'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "price": price,
        "quantity": quantity == null ? null : quantity,
        "SubCategoryId": subCategoryId,
        "Favorites": favorites,
        "Carts": carts,
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
