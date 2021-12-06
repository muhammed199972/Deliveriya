import 'package:delivery_food/model/Products_model.dart';

class ShoppingCartModel {
  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  int? subCategoryId;
  ProductsResponse? originalProductModel;

  ShoppingCartModel({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.price,
    this.quantity,
    this.subCategoryId,
    this.originalProductModel,
  });

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      ShoppingCartModel(
          id: json["id"],
          name: json["name"],
          type: json["type"],
          avatar: json["avatar"],
          price: json["price"],
          quantity: json["quantity"] == null ? null : json["quantity"],
          subCategoryId: json["SubCategoryId"],
          originalProductModel: json['originalProductModel'] != null
              ? new ProductsResponse.fromJson(json['originalProductModel'])
              : null);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "price": price,
        "quantity": quantity == null ? null : quantity,
        "SubCategoryId": subCategoryId,
        'originalProductModel': this.originalProductModel!.toJson(),
      };

  // double get totalProductPrice => quantity * unitPrice;
}
