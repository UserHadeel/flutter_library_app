

import 'dart:convert';

class BookLoanModels {
  BookLoanModels({
    required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.bookId,
        required this.userId,
        required this.numberBorrowed,
        required this.returnDate,
        required this.isReturned,
        required this.createdAt,
        required this.updatedAt,
        required this.bookName,
  });
  //  name = bookcontroller.bookList.where((book) => book.id == controller.bookLoanList[index].bookId).toList();
                //  print('book name ${name[0].title}');

    int id;
    String firstName;
    String lastName;
    String email;
    String phone;
    int bookId;
    int userId;
    int numberBorrowed;
    DateTime returnDate;
    int isReturned;
    DateTime createdAt;
    DateTime updatedAt;
    String bookName;


  factory BookLoanModels.fromJson(Map<String, dynamic> json) {
  return BookLoanModels(
    id: json["id"] ?? 0,
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    bookId: json["book_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    numberBorrowed: json["number_borrowed"] ?? 0,
    returnDate: json["return_date"] != null ? DateTime.parse(json["return_date"]) : DateTime.now(),
    isReturned: json["is_returned"] ?? 0,
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
    bookName: json["book_name"] ?? "",
  );
}

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "book_id": bookId,
        "user_id": userId,
        "number_borrowed": numberBorrowed,
        "return_date": returnDate.toIso8601String(),
        "is_returned": isReturned,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "book_name": bookName,
      };

 static List<BookLoanModels> bookLoanModelsFromJson(List<Map<String, dynamic>> jsonData) {
  final bookLoans = jsonData.map((item) => BookLoanModels.fromJson(item)).toList();
  return bookLoans;
}

  
}

// import 'dart:convert';

// class BookLoanModels {
//   BookLoanModels({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.bookId,
//     required this.userId,
//     required this.numberBorrowed,
//     required this.returnDate,
//     required this.isReturned,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.bookTitle, // حقل اسم الكتاب
//   });

//   int id;
//   String firstName;
//   String lastName;
//   String email;
//   String phone;
//   int bookId;
//   int userId;
//   int numberBorrowed;
//   DateTime returnDate;
//   int isReturned;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String bookTitle; // حقل اسم الكتاب

//   factory BookLoanModels.fromJson(Map<String, dynamic> json) => BookLoanModels(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         email: json["email"],
//         phone: json["phone"],
//         bookId: json["book_id"],
//         userId: json["user_id"],
//         numberBorrowed: json["number_borrowed"],
//         returnDate: DateTime.parse(json["return_date"]),
//         isReturned: json["is_returned"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         bookTitle: json["book_title"], // اسم الكتاب
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "email": email,
//         "phone": phone,
//         "book_id": bookId,
//         "user_id": userId,
//         "number_borrowed": numberBorrowed,
//         "return_date": returnDate.toIso8601String(),
//         "is_returned": isReturned,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "book_title": bookTitle, // اسم الكتاب
//       };

//   static List<BookLoanModels> bookLoanModelsFromJson(String str) {
//     final jsonData = jsonDecode(str);
//     final bookLoans = List<Map<String, dynamic>>.from(jsonData['data']);
//     return bookLoans.map((item) => BookLoanModels.fromJson(item)).toList();
//   }
// }