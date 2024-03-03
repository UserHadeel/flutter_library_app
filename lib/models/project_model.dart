

import 'dart:convert';

class ProjectModels {
  ProjectModels({
    required this.id,
        required this.title,
        required this.studentName,
        required this.supervisorName,
        required this.year,
        required this.depName,
        required this.image,
        required this.resource,
        required this.availableQuantity,
        required this.ableToBorrow,
        required this.ableToDownload,
        required this.createdAt,
        required this.updatedAt,
  });

    int id;
    String title;
    String studentName;
    String supervisorName;
    String year;
    String depName;
    String image;
    String resource;
    int availableQuantity;
    int ableToBorrow;
    int ableToDownload;
    DateTime createdAt;
    DateTime updatedAt;

  factory ProjectModels.fromJson(Map<String, dynamic> json) => ProjectModels(
        id: json["id"],
        title: json["title"],
        studentName: json["student_name"],
        supervisorName: json["supervisor_name"],
        year: json["year"],
        depName: json["dep_name"],
        image: json["image"],
        resource: json["resource"],
        availableQuantity: json["available_quantity"],
        ableToBorrow: json["able_to_borrow"],
        ableToDownload: json["able_to_download"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "student_name": studentName,
        "supervisor_name": supervisorName,
        "year": year,
        "dep_name": depName,
        "image": image,
        "resource": resource,
        "available_quantity": availableQuantity,
        "able_to_borrow": ableToBorrow,
        "able_to_download": ableToDownload,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static List<ProjectModels> projectModelsFromJson(String str) {
    final jsonData = jsonDecode(str);
    final projects = List<Map<String, dynamic>>.from(jsonData['data']);
    return projects.map((item) => ProjectModels.fromJson(item)).toList();
  }
}