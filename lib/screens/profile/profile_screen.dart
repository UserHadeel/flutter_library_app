import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/controllers/UserController.dart';
import 'package:library_app/screens/profile/EditProfile.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
    ProfileScreen({Key? key}) : super(key: key);

    AuthController controller =Get.find();
    // UserController usercontroller =Get.find();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "الملف الشخصي",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // fontFamily: "Amiri"
                ),
          ),
          centerTitle: true,
          backgroundColor: TColor.primary,
          ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
                  Icons.account_circle,
                  size: 130,
                  color: TColor.primary,
                ),
            const SizedBox(height: 15),
            
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(children: [
                const SizedBox(height: 20),
                itemProfile('الأسم', controller.auth[0].data!.name.toString(), CupertinoIcons.person),
                // usercontroller.userList.where((user) => user.id == controller.auth[index].userId).toList()
                const SizedBox(height: 10),
                itemProfile(
                    'الأيميل', controller.auth[0].data!.email.toString(), CupertinoIcons.mail),
                const SizedBox(height: 10),
                itemProfile('كلمة المرور','*********', CupertinoIcons.lock),
                const SizedBox(height: 25),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  EditProfile(username: controller.auth[0].data!.name.toString(), 
                            email: controller.auth[0].data!.email.toString(),)));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: TColor.primary,
                  ),
                  child: const Text('تعديل',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: TColor.primaryLightColor.withOpacity(.4),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        tileColor: Colors.white,
      ),
    );
  }
}