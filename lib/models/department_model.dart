
import 'dart:convert';

class DepartmentModels {
  DepartmentModels({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory DepartmentModels.fromJson(Map<String, dynamic> json) => DepartmentModels(
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

  static List<DepartmentModels> departmentModelsFromJson(String str) {
  final jsonData = jsonDecode(str);
  final department = List<Map<String, dynamic>>.from(jsonData['data']);
  return department.map((item) => DepartmentModels.fromJson(item)).toList();
}
}