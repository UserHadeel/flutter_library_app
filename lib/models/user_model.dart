

import 'dart:convert';

class User {
  User({
    required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.active,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    
  });

   int? id;
    String? name;
    String? email;
  String? emailVerifiedAt;
    bool? active;
    String? role;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt:json["email_verified_at"],
        active: json["active"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "active": active,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  static List<User> userModelsFromJson(String str) {
    final jsonData = jsonDecode(str);
    final users = List<Map<String, dynamic>>.from(jsonData['data']);
    return users.map((item) => User.fromJson(item)).toList();
  }
}