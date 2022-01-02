class OfferUserResponse {
  OfferUserResponse({
    this.id,
    this.afterPrice,
    this.beforePrice,
    this.type,
    this.media,
    this.mediaType,
    this.color,
    this.name,
    this.description,
    this.quantity,
    this.min,
    this.max,
    this.createdAt,
    this.updatedAt,
    this.userOffers,
  });

  int? id;
  int? afterPrice;
  int? beforePrice;
  String? type;
  String? media;
  String? mediaType;
  String? color;
  String? name;
  String? description;
  int? quantity;
  int? min;
  int? max;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<UserOffer>? userOffers;

  factory OfferUserResponse.fromJson(Map<String, dynamic> json) =>
      OfferUserResponse(
        id: json["id"],
        afterPrice: json["afterPrice"] == null ? null : json["afterPrice"],
        beforePrice: json["beforePrice"] == null ? null : json["beforePrice"],
        type: json["type"],
        media: json["media"],
        mediaType: json["mediaType"],
        color: json["color"],
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        min: json["min"],
        max: json["max"] == null ? null : json["max"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userOffers: List<UserOffer>.from(
            json["UserOffers"].map((x) => UserOffer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "afterPrice": afterPrice == null ? null : afterPrice,
        "beforePrice": beforePrice == null ? null : beforePrice,
        "type": type,
        "media": media,
        "mediaType": mediaType,
        "color": color,
        "name": name,
        "description": description,
        "quantity": quantity == null ? null : quantity,
        "min": min,
        "max": max == null ? null : max,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "UserOffers": List<dynamic>.from(userOffers!.map((x) => x.toJson())),
      };
}

class UserOffer {
  UserOffer({
    this.id,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.offerId,
  });

  int? id;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? offerId;

  factory UserOffer.fromJson(Map<String, dynamic> json) => UserOffer(
        id: json["id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        offerId: json["OfferId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "UserId": userId,
        "OfferId": offerId,
      };
}

class OfferUserStatus {
  OfferUserStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory OfferUserStatus.fromJson(Map<String, dynamic> json) =>
      OfferUserStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
