import 'dart:convert';

class JournalModels {
  JournalModels({
    required this.id,
    required this.title,
    required this.publishing,
    required this.yearOfPublication,
    required this.image,
    required this.resource,
    required this.ableToDownload,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String publishing;
  String yearOfPublication;
  String image;
  String resource;
  int ableToDownload;
  DateTime createdAt;
  DateTime updatedAt;

  factory JournalModels.fromJson(Map<String, dynamic> json) => JournalModels(
        id: json["id"],
        title: json["title"],
        publishing: json["publishing"],
        yearOfPublication: json["Year_of_publication"],
        image: json["image"],
        resource: json["resource"],
        ableToDownload: json["able_to_download"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "publishing": publishing,
        "Year_of_publication": yearOfPublication,
        "image": image,
        "resource": resource,
        "able_to_download": ableToDownload,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static List<JournalModels> journalModelsFromJson(String str) {
    final jsonData = jsonDecode(str);
    final journals = List<Map<String, dynamic>>.from(jsonData['data']);
    return journals.map((item) => JournalModels.fromJson(item)).toList();
  }
}