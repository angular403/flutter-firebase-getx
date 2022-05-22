class ModelUser {
  String? email;
  String? name;
  String? uid;
  String? role;

  ModelUser({this.email, this.name, this.uid, this.role});

  ModelUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['uid'] = uid;
    data['role'] = role;
    return data;
  }
}
