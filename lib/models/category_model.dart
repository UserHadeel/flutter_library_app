
import 'dart:convert';

class CategoryModels {
  CategoryModels({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static List<CategoryModels> categoryModelsFromJson(String str) {
  final jsonData = jsonDecode(str);
  final categories = List<Map<String, dynamic>>.from(jsonData['data']);
  return categories.map((item) => CategoryModels.fromJson(item)).toList();
}
}