class Auth {
  bool? seccess;
  Data? data;
  String? message;

  Auth({this.seccess, this.data, this.message});

  Auth.fromJson(Map<String, dynamic> json) {
    seccess = json['seccess'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seccess'] = this.seccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? lastname;
  String? phonenumber;
  String? address;
  String? username;
  String? status;
  String? isFirst;
  String? roles;
  String? token;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? password;

  Data(
      {this.id,
        this.name,
        this.lastname,
        this.phonenumber,
        this.address,
        this.username,
        this.status,
        this.isFirst,
        this.roles,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.password});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    username = json['username'];
    status = json['status'];
    isFirst = json['is_first'];
    roles = json['roles'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['phonenumber'] = this.phonenumber;
    data['address'] = this.address;
    data['username'] = this.username;
    data['status'] = this.status;
    data['is_first'] = this.isFirst;
    data['roles'] = this.roles;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}