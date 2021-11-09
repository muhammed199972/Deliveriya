class ProfileResponse {
  ProfileResponse({
    this.id,
    this.name,
    this.type,
    this.avatar,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.addresses,
  });

  int? id;
  dynamic? name;
  String? type;
  dynamic? avatar;
  int? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Address>? addresses;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        avatar: json["avatar"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        addresses: List<Address>.from(
            json["Addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "avatar": avatar,
        "phone": phone,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "Addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.gpsLocation,
    this.locationDescription,
    this.createdAt,
    this.updatedAt,
    this.cityId,
    this.userId,
    this.city,
  });

  int? id;
  dynamic? gpsLocation;
  String? locationDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? cityId;
  int? userId;
  City? city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        gpsLocation: json["GPSLocation"],
        locationDescription: json["locationDescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cityId: json["CityId"],
        userId: json["UserId"],
        city: City.fromJson(json["City"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "GPSLocation": gpsLocation,
        "locationDescription": locationDescription,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "CityId": cityId,
        "UserId": userId,
        "City": city!.toJson(),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class ProfileStatus {
  ProfileStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory ProfileStatus.fromJson(Map<String, dynamic> json) => ProfileStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
