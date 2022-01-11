import 'package:delivery_food/model/Products_model.dart';

class FavoriteResponse {
  int? id;
  String? name;
  String? icon;
  String? avatar;
  List<SubCategories> subCategories = [];

  FavoriteResponse(
      {this.id,
      this.name,
      this.icon,
      this.avatar,
      required this.subCategories});

  FavoriteResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    avatar = json['avatar'];
    if (json['SubCategories'] != null) {
      json['SubCategories'].forEach((v) {
        subCategories.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['avatar'] = this.avatar;
    if (this.subCategories != null) {
      data['SubCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? icon;
  String? avatar;
  List<ProductsResponse> products = [];

  SubCategories(
      {this.id, this.name, this.icon, this.avatar, required this.products});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    avatar = json['avatar'];
    if (json['Products'] != null) {
      json['Products'].forEach((v) {
        products.add(new ProductsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['avatar'] = this.avatar;
    if (this.products != null) {
      data['Products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorites {
  int? id;

  Favorites({this.id});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
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
