import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/screens/about/about_app.dart';
import 'package:library_app/screens/book/book.dart';
import 'package:library_app/screens/home/home.dart';
import 'package:library_app/screens/loanform/loan_table.dart';
import 'package:library_app/screens/loanform/loan_view.dart';
import 'package:library_app/screens/profile/profile_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;
  int selectedTab = 0;
  List menuArr = [
    {
      "name": "الرئيسية",
      "icon": Icons.home,
    },
    {"name": "الكتب", "icon": Icons.menu_book},
    {"name": "مشاريع التخرج", "icon": Icons.library_books},
    {"name": "المجلات العلمية", "icon": Icons.import_contacts},
    {"name": "الأستعارات النشطة", "icon": Icons.fact_check},
    // {"name": "Account", "icon": Icons.account_circle},
  ];
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    // ignore: unused_local_variable
    // var index;
    return Scaffold(
      // backgroundColor: TColor.primary,
      key: sideMenuScaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 237, 243),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(media.width * 0.5),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                )
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectMenu = index;
                        });
                        if (mObj["name"] == "الرئيسية") {
                          Navigator.pop(context);
                        } else if (mObj["name"] == "الكتب") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Book()),
                          );
                        } else if (mObj["name"] == "مشاريع التخرج") {
                          // انتقل إلى صفحة مشاريع التخرج
                        } else if (mObj["name"] == "المجلات العلمية") {
                          // انتقل إلى صفحة المجلات العلمية
                        } else if (mObj["name"] == "الأستعارات النشطة") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const LoanTableScreen()),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        decoration: selectMenu == index
                            ? BoxDecoration(color: TColor.primary, boxShadow: [
                                BoxShadow(
                                  color: TColor.primary,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ])
                            : null,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectMenu = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mObj["name"].toString(),
                                style: TextStyle(
                                  color: selectMenu == index
                                      ? Colors.white
                                      : TColor.text,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.primary,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: TColor.subTitle,
                          size: 25,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedTab,
        children:  [
          // const HomeView(),
           Home(),
          // const SearchView(),
          // const SearchPage(),
          const AboutApp(),
          // const Book(),
           ProfileScreen(),
          
          Container(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedTab,
        backgroundColor: Colors.transparent,
        color: TColor.primary,
        // animationDuration: const Duration(microseconds: 400),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
            size: 30,
          ),
          Icon(
           Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
          
        ],
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
      ),
    );
  }
}
  