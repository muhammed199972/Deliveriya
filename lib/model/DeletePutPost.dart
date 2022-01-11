class DeletePutPostResponse {
  DeletePutPostResponse({
    this.msg,
  });

  String? msg;

  factory DeletePutPostResponse.fromJson(Map<String, dynamic> json) =>
      DeletePutPostResponse(
        msg: json["response"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "response": msg,
      };
}
