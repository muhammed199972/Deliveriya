class OrderResponse {
  OrderResponse({
    this.id,
    this.status,
    this.finalPrice,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.orderItems,
  });

  int? id;
  String? status;
  int? finalPrice;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  List<dynamic>? orderItems;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        id: json["id"],
        status: json["status"],
        finalPrice: json["finalPrice"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        orderItems: List<dynamic>.from(json["OrderItems"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "finalPrice": finalPrice,
        "price": price,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "UserId": userId,
        "OrderItems": List<dynamic>.from(orderItems!.map((x) => x)),
      };
}

class OrderStatus {
  OrderStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
