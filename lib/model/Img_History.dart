class ImgOrderResponse {
  ImgOrderResponse({
    this.id,
    this.avatar,
    this.color,
    this.month,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? avatar;
  String? color;
  String? month;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ImgOrderResponse.fromJson(Map<String, dynamic> json) =>
      ImgOrderResponse(
        id: json["id"],
        avatar: json["avatar"],
        color: json["color"],
        month: json["month"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "color": color,
        "month": month,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class ImgOrderStatus {
  ImgOrderStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory ImgOrderStatus.fromJson(Map<String, dynamic> json) => ImgOrderStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
