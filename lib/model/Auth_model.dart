class AuthResponse {
  AuthResponse({
    this.code,
  });

  String? code;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}

class AuthStatus {
  AuthStatus({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory AuthStatus.fromJson(Map<String, dynamic> json) => AuthStatus(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}

class SignUpResponse {
  SignUpResponse({
    this.data,
  });

  Data? data;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.accessToken,
    this.refreshToken,
  });

  String? accessToken;
  String? refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
