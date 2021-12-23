class ProfileResponse {
  ProfileResponse({
    this.id,
    this.name,
    this.date,
    this.type,
    this.gender,
    this.avatar,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.addresses,
  });

  int? id;
  dynamic? name;
  String? type;
  String? date;
  String? gender;
  dynamic? avatar;
  int? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Address>? addresses;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        id: json["id"],
        date: json["birthDate"],
        name: json["name"],
        gender: json["gender"],
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
        "birthDate": date,
        "gender": gender,
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
    this.townId,
    this.userId,
    this.town,
  });

  int? id;
  dynamic? gpsLocation;
  String? locationDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? townId;
  int? userId;
  Town? town;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
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
