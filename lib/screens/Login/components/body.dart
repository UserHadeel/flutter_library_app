import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/rounded_button.dart';
import 'package:library_app/components/rounded_input_field.dart';
import 'package:library_app/components/rounded_password_field.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/screens/Login/components/background.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({
    super.key,
  });

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //this size provide us total height and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: TColor.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),

          ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                "assets/images/login.jpg",
                height: size.height * 0.27,
              )),

          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
            controller: email,
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            controller: password,
          ),

          GetX<AuthController>(
              init: AuthController(),
              builder: (controller) {
                // ignore: unrelated_type_equality_checks
                if (controller.isLoading == true) {
                  return const CircularProgressIndicator();
                } else {
                  return RoundedButton(
                    text: "تسجيل الدخول",
                    press: ()  {
                      // controller.login("hadeel99@gmail.com", "12341234");
                   controller.login("test@uot.edu.ly", "12341234");
                   

                  //  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
                  //  sharedPref.setString("email",username.text);
                      // controller.login(username.text, password.text);
                    },
                    onPressed: () {},
                  );
                }
              }),

          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
