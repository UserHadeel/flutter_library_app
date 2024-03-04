import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/controllers/AuthController.dart';
import 'dart:convert';
import 'package:library_app/models/project_loan_model.dart';
import 'package:intl/intl.dart';

var authController = Get.find<AuthController>();

class ProjectLoanRepository {
  static getLoan($user_id) async {
    // ignore: non_constant_identifier_names
    String user_id = authController.auth.isNotEmpty
        ? authController.auth[0].data?.id.toString() ?? ""
        : "";

    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/loansproject/$user_id"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var loanData = jsonData['data']
          .cast<Map<String, dynamic>>(); // تحويل البيانات إلى النوع الصحيح
      print(loanData);
      return ProjectLoanModels.projectLoanModelsFromJson(loanData);
    } else {
      throw Exception('فشل في جلب  سجل الاستعارات');
    }
  }

  static saveLoan(
      int graduationProjectsId,
      int user_id,
      String firstName,
      String lastName,
      String email,
      String phone,
      DateTime returnDate,
      int numberBorrowed) async {
    String user_id = authController.auth.isNotEmpty
        ? authController.auth[0].data?.id.toString() ?? ""
        : "";
    var formattedDate = DateFormat('yyyy-MM-dd').format(returnDate);

    var response = await http.put(
      Uri.parse("http://10.0.2.2:8000/api/project-loans"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(
        {
          "graduation_projects_id": graduationProjectsId,
          "user_id": user_id,
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "return_date": formattedDate,
          "number_borrowed": numberBorrowed,
        },
      ),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = ProjectLoanModels.fromJson(jsonDecode(response.body));
      // ignore: avoid_print
      print(jsonData);
      return jsonData;
    } else {
      throw Exception('فشل في طلب الاستعارة');
    }
  }
}