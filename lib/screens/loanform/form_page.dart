import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/controllers/BookLoanController.dart';

class FormPage extends StatefulWidget {
  final String email;
  final String bookId;
  final String user_id;
  final controller = Get.put(BookLoanController());
  FormPage({super.key, required this.email, required this.bookId, required this.user_id});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // ignore: non_constant_identifier_names
  final _Keyform = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController returnDate = TextEditingController();
  TextEditingController numberBorrowed = TextEditingController();
  TextEditingController bookId = TextEditingController();
  TextEditingController user_id = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    email.text = widget.email;
    bookId.text = widget.bookId;
    user_id.text = widget.user_id;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //this size provide us total height and width of our screen
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            "طلب إستعارة ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // fontFamily: "Amiri"
            ),
          ),
          centerTitle: true,
          backgroundColor: TColor.primary,
        ),

        //body content
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _Keyform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.values.first,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      controller: firstName,
                      decoration: InputDecoration(
                        labelText: "الاسم الأول",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: TColor.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 20, 102, 168)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      controller: lastName,
                      decoration: InputDecoration(
                        labelText: "الاسم الأخير",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: TColor.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 20, 102, 168)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        const emailPattren =
                            '^([w]+([w.]*))(@)(uot)(.)(edu)(.)(ly)';
                        final regExp = RegExp(emailPattren);
                        if (value == null || value.isEmpty) {
                          return "هذا الحقل مطلوب";
                        } else if (!regExp.hasMatch(value)) {
                          return "يرجى التحقق من بيانات هذا الحقل";
                        } else if (regExp.hasMatch(value)) {
                          // ignore: avoid_print
                          print("تم التحقق");
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      // enabled: false,
                      autofocus: true,
                      textAlign: TextAlign.right,
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "البريد الالكتروني",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 20, 102, 168)),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        const phonePattren =
                            '(^2189[1|2|4][0-9]{7})|(^09[1|2|4][0-9]{7})';
                        final regExp = RegExp(phonePattren);
                        if (value == null || value.isEmpty) {
                          return "هذا الحقل مطلوب";
                        } else if (regExp.hasMatch(value)) {
                          // ignore: avoid_print
                          print("تم التحقق");
                        } else if (!regExp.hasMatch(value)) {
                          return "يرجى التحقق من بيانات هذا الحقل";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.right,
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: "رقم الهاتف",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 20, 102, 168)),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: DateTimeField(
                      decoration: InputDecoration(
                        labelText: "تاريخ الأرجاع",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF1466A8)),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      firstDate: DateTime.now().add(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 40)),
                      initialPickerDateTime:
                          DateTime.now().add(const Duration(days: 20)),
                      onChanged: (DateTime? value) {
                        if (value != null) {
                          returnDate.text = value.toString();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        
                       int availablequantity = 6;
                        var v = int.parse(value!);
                        if (value.isEmpty) {
                          return "هذا الحقل مطلوب";
                        }
                        if (v > availablequantity) {
                          return " لايمكن الاستعارة";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      // controller: returnDate,
                      decoration: InputDecoration(
                        labelText: "عددالنسخ المراد استعارتها",
                        labelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 20, 102, 168)),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.copy,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GetX<BookLoanController>(
                    init: BookLoanController(),
                    builder: (controller) {
                      if(controller.isLoading == true){
                        return const CircularProgressIndicator();
                      }else{
                        return  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      backgroundColor: const Color(0xFF37AB48),
                    ),
                    child: const Text(
                      'إرسال',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      if (_Keyform.currentState!.validate()) {
                        DateTime selectedDate = DateTime.parse(returnDate.text);
                        int numberOfBorrowed = int.parse(numberBorrowed.text);
                        int selectedBookNumber = int.parse(bookId.text);
                         int selectedUserID = int.parse(user_id.text); // رقم المستخدم المحدد
                          
                          controller.saveLoans(
                            selectedBookNumber,
                            selectedUserID,
                            firstName.text,
                            lastName.text,
                            email.text,
                            phone.text,
                            selectedDate,
                            numberOfBorrowed,
                          );                        
                        print("done");
                      }
                    },
                  );
                      }
                      
                    }
                  ),
                 
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "ملاحظة : مدة الاستعارة يجب الا تزيد عن 7 أيام",
                    style: TextStyle(
                      color: Color(0xFF575656),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
