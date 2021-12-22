class DeleteResponse {
  DeleteResponse({
    this.msg,
  });

  String? msg;

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
        msg: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "response": msg,
      };
}
