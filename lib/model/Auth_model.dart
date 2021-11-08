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
