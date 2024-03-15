import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/controllers/UserController.dart';

class EditProfile extends StatefulWidget {
  final String username;
  // final String email;
  const EditProfile({
    super.key,
    required this.username,
    required String email,
    // required this.email,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // ignore: non_constant_identifier_names
  final _EKeyform = GlobalKey<FormState>();
  final _DKeyform = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  TextEditingController deleteAccountPassword = TextEditingController();


  AuthController _authController = Get.find();


  @override
  void initState() {
    username.text = widget.username;
    // email.text = widget.email;
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          // automaticallyImplyLeading: false,
          title: const Text(
            " تعديل الصفحة الشخصية ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17
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
              key: _EKeyform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.values.first,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 130,
                    color: TColor.primary,
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
                      autofocus: true,
                      controller: username,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: "الأسم",
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 17),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: TColor.primaryLightColor),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          CupertinoIcons.person,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  // Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       const emailPattren =
                  //           '^([w]+([w.]*))(@)(uot)(.)(edu)(.)(ly)';
                  //       final regExp = RegExp(emailPattren);
                  //       if (value == null  value.isEmpty) {
                  //         return "هذا الحقل مطلوب";
                  //       } else if (!regExp.hasMatch(value)) {
                  //         return "يرجى التحقق من بيانات هذا الحقل";
                  //       } else if (regExp.hasMatch(value)) {
                  //         // ignore: avoid_print
                  //         // print("تم التحقق");
                  //       }
                  //       return null;
                  //     },
                  //     keyboardType: TextInputType.emailAddress,
                  //     textAlign: TextAlign.right,
                  //     controller: email,
                  //     decoration: InputDecoration(
                  //       labelText: "البريد الالكتروني",
                  //       labelStyle:
                  //           const TextStyle(color: Colors.black, fontSize: 17),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: TColor.primary),
                  //           borderRadius: BorderRadius.circular(20)),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderSide:
                  //               BorderSide(color: TColor.primaryLightColor),
                  //           borderRadius: BorderRadius.circular(20)),
                  //       prefixIcon: Icon(
                  //         CupertinoIcons.mail,
                  //         color: TColor.primary,
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.015,
                  // ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        const passwordPattren =
                            '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*).{8,16}';
                        final regExp = RegExp(passwordPattren);
                        // if (value == null || value.isEmpty) {
                        //   return "هذا الحقل مطلوب";
                        // }
                        // else if (regExp.hasMatch(value)) {
                        //   // ignore: avoid_print
                        //   print("تم التحقق");
                        // } else if (!regExp.hasMatch(value)) {
                        //   return "يرجى التحقق من بيانات هذا الحقل";
                        // }
                        // return null;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: " كلمةالسر",
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 17),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: TColor.primaryLightColor,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      validator: (value) {
                        // ignore: constant_identifier_names
                        const C_passwordPattren =
                            '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*).{8,16}';
                        final regExp = RegExp(C_passwordPattren);
                        // if (value == null || value.isEmpty) {
                        //   return "هذا الحقل مطلوب";
                        //  }
                          // else if (regExp.hasMatch(value)) {
                        //   // ignore: avoid_print
                        //   print("تم التحقق");
                        // } else if (!regExp.hasMatch(value)) {
                        //   return "يجب التحقق من بيانات هذا الحقل";
                        // }

                        // print(password.text);

                        // print(passwordConfirm.text);
                        if (password.text != passwordConfirm.text) {
                          return "كلمة السر غير متطابقة";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.right,
                      controller: passwordConfirm,
                      decoration: InputDecoration(
                        labelText: "تأكيد كلمةالسر",
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 17),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: TColor.primary),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: TColor.primaryLightColor),
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: TColor.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetX<UserController>(
                          init: UserController(),
                          builder: (controller) {
                            // ignore: unrelated_type_equality_checks
                            if (controller.isLoading == true) {
                              return const CircularProgressIndicator();
                            } else {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                  backgroundColor:
                                      const Color.fromARGB(255, 55, 171, 72),
                                ),
                                child: const Text(
                                  'حفظ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    // fontFamily: "Amiri"
                                  ),
                                ),
                                onPressed: () {

                              
                                  if (_EKeyform.currentState!.validate()) {
                                    controller.userUpdate(
                                        username.text,
                                        email.text,
                                        password.text,
                                        passwordConfirm.text);

                                  }
                                },
                              );
                            }
                          }),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 45),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'حذف الحساب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  // fontFamily: "Amiri"
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return simpleAlertDialog();
                                    });
                              },
                            ),
                          ),
                          const Text(
                            "هل تريد حذف الحساب؟",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                // fontFamily: "Amiri",
                                color: Color.fromARGB(115, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget simpleAlertDialog() {
    return GetX<UserController>(
      init: UserController(),
      builder: (controller) {
         if(controller.isLoading == true){
           return Center(child: CircularProgressIndicator());
         }else{
           return AlertDialog(
             title: const Text(
               "حذف حساب",
               textAlign: TextAlign.center,
             ),
             icon: const Icon(
               Icons.warning,
               size: 50,
               color: Color.fromARGB(255, 210, 191, 25),
             ),
             content: const Text(
               "هل أنت متأكد أنك تريد حذف الحساب؟",
               textAlign: TextAlign.center,
             ),
             actions: [
               Form(
                 key: _DKeyform,
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: TextFormField(
                     controller: deleteAccountPassword,
                     keyboardType: TextInputType.text,
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return "هذا الحقل مطلوب";
                       }
                       // print(password.text);
                       //
                       // print(deleteAccountPassword.text);


                       // if (password.text != deleteAccountPassword.text) {
                       //   return "كلمة السر غير متطابقة";
                       // }
                       // return null;
                     },
                     textAlign: TextAlign.right,
                     decoration: InputDecoration(
                       labelText: "أدخل كلمة السر",
                       labelStyle:
                       const TextStyle(color: Color.fromARGB(255, 79, 79, 79)),
                       enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color.fromARGB(255, 73, 73, 73)),
                           borderRadius: BorderRadius.circular(20)),
                       focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Color.fromARGB(255, 20, 102, 168)),
                           borderRadius: BorderRadius.circular(20)),
                       prefixIcon: const Icon(CupertinoIcons.lock),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 25),
               SizedBox(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       margin: const EdgeInsets.all(5),
                       child: ElevatedButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.greenAccent,
                           ),
                           child: const Text("إلغاء",
                               style: TextStyle(
                                 color: Colors.white,
                               ))),
                     ),
                     ElevatedButton(
                       onPressed: () {
                         // Get.find<UserController>().userDelete();
                         if (_DKeyform.currentState!.validate()) {
                           controller.userDelete(deleteAccountPassword.text.toString());


                         }

                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.red,
                       ),
                       child: const Text(
                         "حذف",
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
             shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(16))),
             alignment: AlignmentDirectional.topStart,
           );
         }
      },
    );
  }
}