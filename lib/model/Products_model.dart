// To parse this JSON data, do
//
//     final productsProductsStatus = productsProductsStatusFromJson(jsonString);

class ProductsResponse {
  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  int? min;
  int? max;
  String? measuringUnit;
  int? afterOffer;
  List favorites = [];
  List carts = [];
  List<OfferItems> offerItems = [];

  ProductsResponse(
      {this.id,
      this.name,
      this.type,
      this.avatar,
      this.price,
      this.quantity,
      this.min,
      this.max,
      this.measuringUnit,
      this.afterOffer,
      required this.favorites,
      required this.carts,
      required this.offerItems});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    avatar = json['avatar'];
    price = json['price'];
    quantity = json['quantity'];
    min = json['min'];
    max = json['max'];
    measuringUnit = json['measuringUnit'];
    afterOffer = json['afterOffer'];
    if (json['Favorites'] != null) {
      json['Favorites'].forEach((v) {
        favorites.add(v);
      });
    }
    if (json['Carts'] != null) {
      json['Carts'].forEach((v) {
        carts.add(v);
      });
    }
    if (json['OfferItems'] != null) {
      json['OfferItems'].forEach((v) {
        offerItems.add(new OfferItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['min'] = this.min;
    data['max'] = this.max;
    data['measuringUnit'] = this.measuringUnit;
    data['afterOffer'] = this.afterOffer;
    if (this.favorites != null) {
      data['Favorites'] = this.favorites.map((v) => v.toJson()).toList();
    }
    if (this.carts != null) {
      data['Carts'] = this.carts.map((v) => v.toJson()).toList();
    }
    if (this.offerItems != null) {
      data['OfferItems'] = this.offerItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferItems {
  int? id;
  Offer? offer;

  OfferItems({this.id, this.offer});

  OfferItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offer = json['Offer'] != null ? new Offer.fromJson(json['Offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.offer != null) {
      data['Offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Offer {
  int? id;

  Offer({this.id});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
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
