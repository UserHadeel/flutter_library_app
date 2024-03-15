
import 'dart:convert';

class CategoryModels {
  CategoryModels({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  static List<CategoryModels> categoryModelsFromJson(String str) {
  final jsonData = jsonDecode(str);
  final categories = List<Map<String, dynamic>>.from(jsonData['data']);
  return categories.map((item) => CategoryModels.fromJson(item)).toList();
}
}