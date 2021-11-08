class SubcategoryStatus {
  int? code;
  String? msg;

  SubcategoryStatus({this.code, this.msg});

  SubcategoryStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}

class SubcategoryResponse {
  int? id;
  String? avatar;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? categoryId;

  SubcategoryResponse(
      {this.id,
      this.avatar,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  SubcategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['CategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['CategoryId'] = this.categoryId;
    return data;
  }
}
