class ErrorResponse {
  ErrorResponse({
    this.msg,
  });

  String? msg;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
