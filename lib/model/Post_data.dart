class PostResponse {
  PostResponse({
    this.msg,
  });

  String? msg;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        msg: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": msg,
      };
}
