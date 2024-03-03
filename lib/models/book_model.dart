

import 'dart:convert';

class BookModels {
  BookModels({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.serialNumber,
    required this.availableQuantity,
    required this.description,
    required this.catName,
    required this.image,
    required this.resource,
    required this.ableToBorrow,
    required this.ableToDownload,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String author;
  String publisher;
  String serialNumber;
  int availableQuantity;
  String description;
  String catName;
  String image;
  String resource;
  int ableToBorrow;
  int ableToDownload;
  DateTime createdAt;
  DateTime updatedAt;

  factory BookModels.fromJson(Map<String, dynamic> json) => BookModels(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        publisher: json["publisher"],
        serialNumber: json["serial_number"],
        availableQuantity: json["available_quantity"],
        description: json["description"],
        catName: json["cat_name"],
        image: json["image"],
        resource: json["resource"],
        ableToBorrow: json["able_to_borrow"],
        ableToDownload: json["able_to_download"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "publisher": publisher,
        "serial_number": serialNumber,
        "available_quantity": availableQuantity,
        "description": description,
        "cat_name": catName,
        "image": image,
        "resource": resource,
        "able_to_borrow": ableToBorrow,
        "able_to_download": ableToDownload,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  static List<BookModels> bookModelsFromJson(String str) {
    final jsonData = jsonDecode(str);
    final books = List<Map<String, dynamic>>.from(jsonData['data']);
    return books.map((item) => BookModels.fromJson(item)).toList();
  }
}