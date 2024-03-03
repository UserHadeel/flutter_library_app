import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/rounded_button.dart';
import 'package:library_app/screens/Login/login_screen.dart';
import 'package:library_app/screens/Welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size; //this size provide us total height and width of our screen
    return  Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'مرحبا بك ',
               style: TextStyle(
                color: TColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.04,),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            Image.asset('assets/images/welcome.jpg'),
        
            SizedBox(height: size.height * 0.05,),
             RoundedButton(
              text: "تسجيل الدخول",
               press: () {
                Navigator.push
                (context, 
                MaterialPageRoute(
                  builder: (context){
                    return const LoginScreen();
                    },
                  ),
                 );
                }, onPressed: () {  }, 
            )
          ],
        ),
      ),
    );
  }
}

