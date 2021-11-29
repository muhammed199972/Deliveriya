class AdsStatus {
  int? code;
  String? msg;

  AdsStatus({this.code, this.msg});

  AdsStatus.fromJson(Map<String, dynamic> json) {
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

class AdsResponse {
  int? id;
  String? avatar;
  String? url;
  String? createdAt;
  String? updatedAt;

  AdsResponse({this.id, this.avatar, this.url, this.createdAt, this.updatedAt});

  AdsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
