class DeleteResponse {
  DeleteResponse({
    this.msg,
  });

  String? msg;

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
        msg: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": msg,
      };
}
