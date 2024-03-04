import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/models/project_loan_model.dart';
import 'package:library_app/repositories/ProjectLoan_Repository.dart';
import 'package:library_app/screens/grad_projects/project.dart';

class ProjectLoanController extends GetxController {
  var projectLoanList = <ProjectLoanModels>[].obs;
   var projectLoan = <ProjectLoanModels>[].obs;
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

  var projectLoans = await ProjectLoanRepository.getLoan(user_id);
  try {
    if (projectLoans != null) {
      projectLoanList.clear(); 
      projectLoanList.assignAll(projectLoans);
      isLoading.value  = false;
      update();
    }
  } finally {
    isLoading.value = false;
    update();
  }
}

void saveLoans(
    int graduationProjectsId, // رقم الكتاب
    int user_id,
    String firstName,
    String lastName,
    String email,
    String phone,
    DateTime returnDate,
    int numberBorrowed) async {
      
  update();

var projectLoan = await ProjectLoanRepository.saveLoan(
  graduationProjectsId, 
   user_id,
   firstName, lastName, email, phone,
  returnDate, numberBorrowed,
);
  try {
    if (projectLoan != null) {
      projectLoan.clear();
      projectLoan.assignAll(projectLoan);
      isLoading.value = false;
      update();

      Get.snackbar(
        "صح",
        "تم طلب الاستعارة بنجاح",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(const Project());
    }
  } finally {
    isLoading.value = false;
    update();
  }
}
}
