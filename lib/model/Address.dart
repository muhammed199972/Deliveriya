class AddressResponse {
  AddressResponse({
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

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
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

class AddressStatus {
  AddressStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory AddressStatus.fromJson(Map<String, dynamic> json) => AddressStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
