class CitiesResponse {
  CitiesResponse({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class CitiesStatus {
  CitiesStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory CitiesStatus.fromJson(Map<String, dynamic> json) => CitiesStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}

// class TownResponse {
//   TownResponse({
//     this.id,
//     this.name,
//   });

//   int? id;
//   String? name;

//   factory TownResponse.fromJson(Map<String, dynamic> json) => TownResponse(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }

// class TownStatus {
//   TownStatus({
//     this.code,
//     this.msg,
//   });

//   int? code;
//   String? msg;

//   factory TownStatus.fromJson(Map<String, dynamic> json) => TownStatus(
//         code: json["code"],
//         msg: json["msg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "msg": msg,
//       };
// }

class CityTownResponse {
  CityTownResponse({
    this.id,
    this.name,
    this.towns,
  });

  int? id;
  String? name;
  List<Townm>? towns;

  factory CityTownResponse.fromJson(Map<String, dynamic> json) =>
      CityTownResponse(
        id: json["id"],
        name: json["name"],
        towns: List<Townm>.from(json["Towns"].map((x) => Townm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Towns": List<dynamic>.from(towns!.map((x) => x.toJson())),
      };
}

class Townm {
  Townm({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Townm.fromJson(Map<String, dynamic> json) => Townm(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class CityTownStatus {
  CityTownStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory CityTownStatus.fromJson(Map<String, dynamic> json) => CityTownStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
