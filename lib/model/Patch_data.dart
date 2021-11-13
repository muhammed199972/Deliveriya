class PatchResponse {
  PatchResponse({
    this.msg,
  });

  String? msg;

  factory PatchResponse.fromJson(Map<String, dynamic> json) => PatchResponse(
        msg: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": msg,
      };
}
