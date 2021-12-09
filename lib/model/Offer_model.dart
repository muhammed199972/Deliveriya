class OffersResponse {
  int? id;
  int? afterPrice;
  int? beforePrice;
  String? media;
  String? mediaType;
  String? caption;
  String? name;
  String? createdAt;
  String? updatedAt;

  OffersResponse(
      {this.id,
      this.afterPrice,
      this.beforePrice,
      this.media,
      this.mediaType,
      this.caption,
      this.name,
      this.createdAt,
      this.updatedAt});

  OffersResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    afterPrice = json['afterPrice'];
    beforePrice = json['beforePrice'];
    media = json['media'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    name = json['name'];
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
    data['caption'] = this.caption;
    data['name'] = this.name;
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
