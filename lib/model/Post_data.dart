class PostResponse {
  PostResponse({
    this.id,
  });

  int? id;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
