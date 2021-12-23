class AddressResponse {
  AddressResponse({
    this.id,
    this.gpsLocation,
    this.street,
    this.phone,
    this.locationDescription,
    this.createdAt,
    this.updatedAt,
    this.townId,
    this.userId,
    this.town,
  });

  int? id;
  String? street;
  String? phone;
  dynamic? gpsLocation;
  String? locationDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? townId;
  int? userId;
  Town? town;

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
        id: json["id"],
        street: json["street"],
        phone: json["phone"],
        gpsLocation: json["GPSLocation"],
        locationDescription: json["locationDescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        townId: json["TownId"],
        userId: json["UserId"],
        town: Town.fromJson(json["Town"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "phone": phone,
        "GPSLocation": gpsLocation,
        "locationDescription": locationDescription,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "TownId": townId,
        "UserId": userId,
        "Town": town!.toJson(),
      };
}

class Town {
  Town({
    this.id,
    this.name,
    this.cityId,
    this.city,
  });

  int? id;
  String? name;
  int? cityId;
  City? city;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
        id: json["id"],
        name: json["name"],
        cityId: json["CityId"],
        city: City.fromJson(json["City"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "CityId": cityId,
        "City": city!.toJson(),
      };
}

class City {
  City({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
