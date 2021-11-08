class FavoriteResponse {
  FavoriteResponse({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.subCategoryId,
    this.favorites,
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
  List<Favorite>? favorites;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      FavoriteResponse(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subCategoryId: json["SubCategoryId"],
        favorites: List<Favorite>.from(
            json["Favorites"].map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "price": price,
        "quantity": quantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "SubCategoryId": subCategoryId,
        "Favorites": List<dynamic>.from(favorites!.map((x) => x.toJson())),
      };
}

class Favorite {
  Favorite({
    this.id,
  });

  int? id;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class FavoriteStatus {
  FavoriteStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory FavoriteStatus.fromJson(Map<String, dynamic> json) => FavoriteStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
