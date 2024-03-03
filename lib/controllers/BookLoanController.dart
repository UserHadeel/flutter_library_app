import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/models/book_loan_model.dart';
import 'package:library_app/repositories/BookLoan_Repository.dart';
import 'package:library_app/screens/book/book.dart';

class BookLoanController extends GetxController {
  var bookLoanList = <BookLoanModels>[].obs;
   var bookLoan = <BookLoanModels>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getLoans();
  }

  void getLoans() async {
    update();
  var authController = Get.find<AuthController>();
  String user_id = authController.auth.isNotEmpty
      ? authController.auth[0].data?.id.toString() ?? ""
      : "";

  var bookLoans = await BookLoanRepository.getLoan(user_id);
  try {
    if (bookLoans != null) {
      bookLoanList.clear(); 
      bookLoanList.assignAll(bookLoans);
      isLoading.value  = false;
      update();
    }
  } finally {
    isLoading.value = false;
    update();
  }
}

void saveLoans(
    int bookId, // رقم الكتاب
    int user_id,
    String firstName,
    String lastName,
    String email,
    String phone,
    DateTime returnDate,
    int numberBorrowed) async {
      
  update();

var bookLoan = await BookLoanRepository.saveLoan(
  bookId, 
   user_id,
   firstName, lastName, email, phone,
  returnDate, numberBorrowed,
);
  try {
    if (bookLoan != null) {
      bookLoan.clear();
      bookLoan.assignAll(bookLoan);
      isLoading.value = false;
      update();

      Get.snackbar(
        "صح",
        "تم طلب الاستعارة بنجاح",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(const Book());
    }
  } finally {
    isLoading.value = false;
    update();
  }
}
}
