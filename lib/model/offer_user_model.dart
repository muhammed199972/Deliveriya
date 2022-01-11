class OfferUserResponse {
  List<Item> item = [];
  int? total;

  static var obs;

  OfferUserResponse({required this.item, this.total});

  OfferUserResponse.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Item {
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
  String? category;
  String? subCategory;
  String? createdAt;
  String? updatedAt;
  List<UserOffers>? userOffers;

  Item(
      {this.id,
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
      this.category,
      this.subCategory,
      this.createdAt,
      this.updatedAt,
      this.userOffers});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    afterPrice = json['afterPrice'];
    beforePrice = json['beforePrice'];
    type = json['type'];
    media = json['media'];
    mediaType = json['mediaType'];
    color = json['color'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    min = json['min'];
    max = json['max'];
    category = json['Category'];
    subCategory = json['SubCategory'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['UserOffers'] != null) {
      userOffers = <UserOffers>[];
      json['UserOffers'].forEach((v) {
        userOffers!.add(new UserOffers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['afterPrice'] = this.afterPrice;
    data['beforePrice'] = this.beforePrice;
    data['type'] = this.type;
    data['media'] = this.media;
    data['mediaType'] = this.mediaType;
    data['color'] = this.color;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['min'] = this.min;
    data['max'] = this.max;
    data['Category'] = this.category;
    data['SubCategory'] = this.subCategory;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.userOffers != null) {
      data['UserOffers'] = this.userOffers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserOffers {
  int? id;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? offerId;

  UserOffers(
      {this.id,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.offerId});

  UserOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['UserId'];
    offerId = json['OfferId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['UserId'] = this.userId;
    data['OfferId'] = this.offerId;
    return data;
  }
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
