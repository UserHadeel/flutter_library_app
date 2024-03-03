import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';

class JournalView extends StatefulWidget {
  const JournalView({Key? key}) : super(key: key);

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  TextEditingController txtSearch = TextEditingController();
  int selectTag = 0;

  List<Map<String, dynamic>> journalArr = [
      {
      "title": "Book",
      "description": "Mitch Weiss",
      "img": "assets/images/b5.jpg",
    },
    {
      "title": "Business",
      "description": "Mitch Weiss",
      "img": "assets/images/b2.jpg",
    },
    {
      "title": "Children",
      "description": "Mitch Weiss",
      "img": "assets/images/b3.jpg",
    },
    {
      "title": "iography",
      "description": "Mitch Weiss",
      "img": "assets/images/b5.jpg",
    },
    {
      "title": "usiness",
      "description": "Mitch Weiss",
      "img": "assets/images/b2.jpg",
    },
    {
      "title": "hildren",
      "description": "Mitch Weiss",
      "img": "assets/images/b3.jpg",
    },
  ];

  List<Map<String, dynamic>> _searchResults = [];

  void _onSearch(String searchText) {
    setState(() {
      _searchResults = journalArr
          .where((journal) => journal['title']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });

    if (_searchResults.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('لا يوجد مجلات'),
          content: const Text('لا يوجد مجلات تطابق بحثك.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('موافق'),
            ),
          ],
        ),
      );
    }
  }
  
  Widget buildListView() {
    List<Map<String, dynamic>> displayedJournals = _searchResults.isNotEmpty
        ? _searchResults
        : (selectTag == 0 ? journalArr : _getFilteredJournal());

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: displayedJournals.length,
      itemBuilder: (context, index) {
        final journal = displayedJournals[index];
        // return Column(
        //   children: [
        //     JournalCell(
        //       jObj: journal,
        //       index: index,
        //     ),
        //   ],
        // );
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredJournal() {
    if (selectTag == 0) {
      // عرض كل الكتب
      return List<Map<String, dynamic>>.from(journalArr);
    } else if (selectTag == 1) {
      // عرض كتب السيرة الذاتية
      return journalArr.where((journal) => journal["title"] == "Children").toList();
    } else if (selectTag == 2) {
      // عرض كتب الأعمال
      return journalArr.where((journal) => journal["title"] == "Business").toList();
    } else if (selectTag == 3) {
      // عرض كتب الأطفال
      return journalArr.where((journal) => journal["title"] == "iography").toList();
    } else {
      return [];
    }
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
            "قائمة المجلات",
            style: TextStyle(color: TColor.wtext),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       const SizedBox(width: 8),
                  
            //       ElevatedButton(
            //         style: ButtonStyle(
            //           minimumSize:
            //               MaterialStateProperty.all(const Size(100, 50)),
            //           side: MaterialStateProperty.all(BorderSide(
            //             color: TColor.primary,
            //             width: 1.7,
            //           )),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //             selectTag == 0 ? TColor.primary : Colors.white,
            //           ),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             selectTag = 0;
            //             _searchResults = [];
            //           });
            //         },
            //         child: Text(
            //           ' الكل',
            //           style: TextStyle(
            //               color: selectTag == 0 ? Colors.white : TColor.primary,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16),
            //         ),
            //       ),
            //      const SizedBox(width: 8),

            //       ElevatedButton(
            //         style: ButtonStyle(
            //           minimumSize:
            //               MaterialStateProperty.all(const Size(100, 50)),
            //           side: MaterialStateProperty.all(BorderSide(
            //             color: TColor.primary,
            //             width: 1.7,
            //           )),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //             selectTag == 1 ? TColor.primary : Colors.white,
            //           ),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             selectTag = 1;
            //             _searchResults = [];
            //           });
            //         },
            //         child: Text(
            //           'هندسة برمجيات',
            //           style: TextStyle(
            //               color: selectTag == 1 ? Colors.white : TColor.primary,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16,
            //               ),
            //         ),
            //       ),
            //     const  SizedBox(width: 8),
                  
            //       ElevatedButton(
            //         style: ButtonStyle(
            //           minimumSize:
            //               MaterialStateProperty.all(const Size(100, 50)),
            //           side: MaterialStateProperty.all(BorderSide(
            //             color: TColor.primary,
            //             width: 1.7,
            //           )),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //             selectTag == 2 ? TColor.primary : Colors.white,
            //           ),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             selectTag = 2;
            //             _searchResults = [];
            //           });
            //         },
            //         child: Text(
            //           'شبكات',
            //           style: TextStyle(
            //               color: selectTag == 2 ? Colors.white : TColor.primary,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16),
            //         ),
            //       ),
            //       const SizedBox(width: 8),

            //       ElevatedButton(
            //         style: ButtonStyle(
            //           minimumSize:
            //               MaterialStateProperty.all(const Size(100, 50)),
            //           side: MaterialStateProperty.all(BorderSide(
            //             color: TColor.primary,
            //             width: 1.7,
            //           )),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //             selectTag == 3 ? TColor.primary : Colors.white,
            //           ),
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             selectTag = 3;
            //             _searchResults = [];
            //           });
            //         },
            //         child: Text(
            //           'نظم معلومات',
            //           style: TextStyle(
            //               color: selectTag == 3 ? Colors.white : TColor.primary,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 16),
            //         ),
            //       ),
            //       const SizedBox(width: 8),
            //     ],
            //   ),
            // ),
            Container(
              height: 65,
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
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: buildListView(),
            ),
          ],
        ),
      ),
    );
  }
}
