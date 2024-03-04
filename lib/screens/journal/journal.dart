import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/primary_header_container.dart';
import 'package:library_app/controllers/JournalController.dart';
import 'package:library_app/screens/journal/journal_card.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  TextEditingController txtSearch = TextEditingController();
  late JournalController journalController;
 
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    journalController = Get.put<JournalController>(JournalController());
  
  }

  void _onSearch(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            "قائمة المجلات العلمية",
            style: TextStyle(color: TColor.wtext),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // SizedBox(
            //   height: 60,
            //   child: GetX<CategoryController>(
            //     builder: (categoryController) {
            //       var categoryList = categoryController.categoryList;
            //       return ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: categoryList.length + 1,
            //         itemBuilder: (context, index) {
            //           if (index == 0) {
            //             // زر "الكل"
            //             return Obx(() => Container(
            //                   padding: const EdgeInsets.all(3),
            //                   margin: const EdgeInsets.all(3),
            //                   decoration: BoxDecoration(
            //                     border: Border.all(
            //                       color: TColor.primary,
            //                       width: 1.5,
            //                     ),
            //                     borderRadius: BorderRadius.circular(50),
            //                     color: categoryController.selectedIndex.value ==
            //                             0
            //                         ? TColor
            //                             .primary // لون الخلفية الأخضر عند التحديد
            //                         : Colors.white,
            //                   ),
            //                   child: TextButton(
            //                     onPressed: () {
            //                       categoryController.updateSelectedIndex(0);
            //                       journalController.getBooks();
            //                     },
            //                     style: TextButton.styleFrom(
            //                       foregroundColor: categoryController
            //                                   .selectedIndex.value ==
            //                               0
            //                           ? Colors
            //                               .white // لون النص الأبيض عند التحديد
            //                           : TColor.primary,
            //                     ),
            //                     child: Text(
            //                       'الكل',
            //                       style: TextStyle(
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold,
            //                         color: categoryController
            //                                     .selectedIndex.value ==
            //                                 0
            //                             ? Colors
            //                                 .white // لون النص الأبيض عند التحديد
            //                             : TColor.primary,
            //                       ),
            //                     ),
            //                   ),
            //                 ));
            //           }
            //           var category = categoryList[index - 1];
            //           return Obx(() => Container(
            //                 padding: const EdgeInsets.all(3),
            //                 margin: const EdgeInsets.all(3),
            //                 decoration: BoxDecoration(
            //                   border: Border.all(
            //                     color: TColor.primary,
            //                     width: 1.5,
            //                   ),
            //                   borderRadius: BorderRadius.circular(50),
            //                   color: categoryController.selectedIndex.value ==
            //                           index
            //                       ? TColor.primary
            //                       : Colors.white,
            //                 ),
            //                 child: TextButton(
            //                   onPressed: () {
            //                     categoryController.updateSelectedIndex(index);
            //                     journalController
            //                         .getBooksByCategory(category.name);
            //                   },
            //                   style: TextButton.styleFrom(
            //                     foregroundColor: categoryController
            //                                 .selectedIndex.value ==
            //                             index
            //                         ? Colors
            //                             .white // لون النص الأبيض عند التحديد
            //                         : TColor.primary,
            //                   ),
            //                   child: Text(
            //                     category.name,
            //                     style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.bold,
            //                       color: categoryController
            //                                   .selectedIndex.value ==
            //                               index
            //                           ? Colors
            //                               .white // لون النص الأبيض عند التحديد
            //                           : TColor.primary,
            //                     ),
            //                   ),
            //                 ),
            //               ));
            //         },
            //       );
            //     },
            //   ),
            // ),
            Container(
              height: 60,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextField(
                  controller: txtSearch,
                  onChanged: _onSearch,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ابحث عن مجلة',
                    hintStyle: TextStyle(color: TColor.primary),
                    prefixIcon: Icon(
                      Icons.search,
                      color: TColor.primary,
                    ),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                txtSearch.clear();
                                searchQuery = '';
                              });
                            },
                            icon: Icon(Icons.clear, color: TColor.primary),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 8,
              child: GetX<JournalController>(
                builder: (journalController) {
                  if (journalController.isLoading == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: TColor.primary,
                      ),
                    );
                  } else {
                    final filteredJournals = journalController.journalList.where((journal) {
                      return searchQuery.isEmpty ||
                          journal.title.contains(searchQuery) ||
                          journal.publishing.contains(searchQuery);
                    }).toList();

                    if (filteredJournals.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                            children: [
                              Icon(
                                Icons.warning,
                                color: TColor.primary,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "لا يوجد مجلات علمية ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: filteredJournals.length,
                        itemBuilder: (context, index) {
                          final journal = filteredJournals[index];
                          return JournalCardItemWidget(
                            image: journal.image,
                            title: journal.title,
                            publishing: journal.publishing,
                            
                          );
                        },
                      );
                    }
                  }
                },
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
