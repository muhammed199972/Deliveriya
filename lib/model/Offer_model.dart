class OffersResponse {
  OffersResponse({
    this.id,
    this.afterPrice,
    this.beforePrice,
    this.avatar,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? afterPrice;
  int? beforePrice;
  String? avatar;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OffersResponse.fromJson(Map<String, dynamic> json) => OffersResponse(
        id: json["id"],
        afterPrice: json["afterPrice"],
        beforePrice: json["beforePrice"],
        avatar: json["avatar"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "afterPrice": afterPrice,
        "beforePrice": beforePrice,
        "avatar": avatar,
        "name": name,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class OffersStatus {
  OffersStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory OffersStatus.fromJson(Map<String, dynamic> json) => OffersStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
