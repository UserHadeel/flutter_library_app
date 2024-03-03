import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/screens/book/book_home_cell.dart';
import 'package:library_app/screens/grad_projects/project_home_cell.dart';
import 'package:library_app/screens/journal/journal_home_cell.dart';
import 'package:library_app/components/primary_header_container.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/controllers/BookController.dart';
import 'package:library_app/controllers/ProjectController.dart';
import 'package:library_app/screens/book/book.dart';
import 'package:library_app/screens/grad_projects/project.dart';
import 'package:library_app/screens/journal/journal_view.dart';
import 'package:library_app/screens/main_tab/main_tab_view.dart';

class Home extends StatefulWidget {
   const Home({super.key});
 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List journalArr = [
    {
      "name": "c# Book",
      "description": "mark",
      "image": "assets/images/b4.jpg",
    },
    {
      "name": "java Book",
      "description": "Java",
      "image": "assets/images/b2.jpg",
    },
    {
      "name": "html Book ",
      "description": "sara",
      "image": "assets/images/html-s.jpg",
    },
    {
      "name": "PHYSICAL Book",
      "description": "ali",
      "image": "assets/images/PHYSICAL (1).jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
  }
   AuthController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        title:  Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 1,
              ),
              Text(
              "مرحبا ${controller.auth.isNotEmpty ? controller.auth[0].data!.name.toString() : ''}", 
                    style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Tajwal'),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            sideMenuScaffoldKey.currentState?.openEndDrawer();
            sideMenuScaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [],
              ),
            ),

            //books
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 8, bottom: 10, right: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Book()),
                          );
                          // Get.to(const BookView(),);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back, size: 18),
                            Text(
                              "الكل",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الكتب",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.66,
              child: GetX<BookController>(
                init: BookController(),
                builder: (controller) {
                  var bookList = controller.bookList;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                  itemCount: controller.bookList.length >= 2 ? 2 : controller.bookList.length,
                    itemBuilder: (context, index) {
                      var book = bookList[index];
                      // ignore: sized_box_for_whitespace
                      return Container(
                        width: media.width * 0.6,
                        child: BookHomeCell(
                          image: book.image,
                          title: book.title,
                          author: book.author,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            
              //project
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 8, bottom: 10, right: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Project()),
                          );
                          // Get.to(const BookView(),);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back, size: 18),
                            Text(
                              "الكل",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "مشاريع التخرج",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.66,
              child: GetX<ProjectController>(
                init: ProjectController(),
                builder: (controller) {
                  var projectList = controller.projectList;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    itemCount: controller.projectList.length,
                    itemBuilder: (context, index) {
                      var project = projectList[index];
                      // ignore: sized_box_for_whitespace
                      return Container(
                        width: media.width * 0.6,
                        child: ProjectHomeCell(
                          image: project.image,
                          title: project.title,
                          year: project.year,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            
           
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 0, bottom: 10, right: 12),
              //  margin: const EdgeInsets.only(top: 20,),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JournalView()),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back, size: 18),
                            Text(
                              "الكل",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "المجلات العلمية",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: media.width * 0.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: journalArr.length,
                  itemBuilder: ((context, index) {
                    var jObj = journalArr[index] as Map? ?? {};
                    return JournalHomeCell(
                      jObj: jObj,
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
