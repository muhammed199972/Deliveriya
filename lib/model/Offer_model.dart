class OffersResponse {
  int? id;
  int? afterPrice;
  int? beforePrice;
  String? media;
  String? mediaType;
  String? color;
  String? name;
  String? description;
  String? type;

  String? createdAt;
  String? updatedAt;

  OffersResponse(
      {this.id,
      this.afterPrice,
      this.beforePrice,
      this.media,
      this.mediaType,
      this.color,
      this.name,
      this.type,
      this.description,
      this.createdAt,
      this.updatedAt});

  OffersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    afterPrice = json['afterPrice'];
    beforePrice = json['beforePrice'];
    media = json['media'];
    mediaType = json['mediaType'];
    color = json['color'];
    name = json['name'];
    type = json['type'];

    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['afterPrice'] = this.afterPrice;
    data['beforePrice'] = this.beforePrice;
    data['media'] = this.media;
    data['mediaType'] = this.mediaType;
    data['color'] = this.color;
    data['name'] = this.name;

    data['type'] = this.type;

    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
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
