

import 'dart:convert';

class ProjectLoanModels {
  ProjectLoanModels({
    required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.graduationProjectsId,
        required this.userId,
        required this.numberBorrowed,
        required this.returnDate,
        required this.isReturned,
        required this.createdAt,
        required this.updatedAt,
        required this.projectName,
  });
  //  name = bookcontroller.bookList.where((book) => book.id == controller.bookLoanList[index].bookId).toList();
                //  print('book name ${name[0].title}');

    int id;
    String firstName;
    String lastName;
    String email;
    String phone;
    int graduationProjectsId;
    int userId;
    int numberBorrowed;
    DateTime returnDate;
    int isReturned;
    DateTime createdAt;
    DateTime updatedAt;
    String projectName;


  factory ProjectLoanModels.fromJson(Map<String, dynamic> json) {
  return ProjectLoanModels(
    id: json["id"] ?? 0,
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    graduationProjectsId: json["graduation_projects_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    numberBorrowed: json["number_borrowed"] ?? 0,
    returnDate: json["return_date"] != null ? DateTime.parse(json["return_date"]) : DateTime.now(),
    isReturned: json["is_returned"] ?? 0,
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
    projectName: json["project_name"] ?? "",
  );
}

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "graduation_projects_id": graduationProjectsId,
        "user_id": userId,
        "number_borrowed": numberBorrowed,
        "return_date": returnDate.toIso8601String(),
        "is_returned": isReturned,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "project_name": projectName,
      };

 static List<ProjectLoanModels> projectLoanModelsFromJson(List<Map<String, dynamic>> jsonData) {
  final projectLoans = jsonData.map((item) => ProjectLoanModels.fromJson(item)).toList();
  return projectLoans;
}

  
}
