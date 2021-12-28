class OrderResponse {
  OrderResponse({
    this.orderHistory,
    this.orders,
  });

  String? orderHistory;
  List<Order>? orders;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        orderHistory: json["orderHistory"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderHistory": orderHistory,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.status,
    this.finalPrice,
    this.price,
    this.addressId,
    this.orderHistory,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.orderItems,
  });

  int? id;
  String? status;
  int? finalPrice;
  int? price;
  int? addressId;
  String? orderHistory;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  List<OrderItem>? orderItems;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        finalPrice: json["finalPrice"],
        price: json["price"],
        addressId: json["AddressId"],
        orderHistory: json["orderHistory"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        orderItems: List<OrderItem>.from(
            json["OrderItems"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "finalPrice": finalPrice,
        "price": price,
        "AddressId": addressId,
        "orderHistory": orderHistory,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "UserId": userId,
        "OrderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.productId,
    this.product,
  });

  int? id;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderId;
  int? productId;
  Product? product;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderId: json["OrderId"],
        productId: json["ProductId"],
        product: Product.fromJson(json["Product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "OrderId": orderId,
        "ProductId": productId,
        "Product": product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.price,
    this.quantity,
    this.min,
    this.max,
    this.measuringUnit,
  });

  int? id;
  String? name;
  String? type;
  String? avatar;
  int? price;
  int? quantity;
  int? min;
  int? max;
  String? measuringUnit;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        price: json["price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        min: json["min"],
        max: json["max"],
        measuringUnit: json["measuringUnit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "price": price,
        "quantity": quantity == null ? null : quantity,
        "min": min,
        "max": max,
        "measuringUnit": measuringUnit,
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
