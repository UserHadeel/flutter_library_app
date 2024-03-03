import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/controllers/BookLoanController.dart';

class LoanTableScreen extends StatelessWidget {
  const LoanTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الكتب المستعارة',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            // fontFamily: "casual",
          ),
        ),
        backgroundColor: TColor.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<BookLoanController>(
        init: BookLoanController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: TColor.primary,
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListView.builder(
                itemCount: controller.bookLoanList.length,
                itemBuilder: (context, index) {
                  final bookLoan = controller.bookLoanList[index];
                  // print(bookLoan);

                  final String returnDate =
                      bookLoan.returnDate.toString() ?? 'غير محدد';

                  final bool isDatePassed =
                      DateTime.now().isAfter(DateTime.parse(returnDate));

                  return ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Expanded(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 4,
                              // ignore: sort_child_properties_last
                              children: [
                                const Text(
                                  'عنوان الكتاب ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                const Text(":" ,textAlign: TextAlign.right,),
                                Text(
                                  bookLoan.bookName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 15,
                          height: 15,
                        ),
                        Icon(
                            isDatePassed ? Icons.warning : Icons.check_circle,
                            color: isDatePassed ? Colors.red : Colors.green,
                          ),
                        Flexible(
                          child: Text(
                            'تاريخ الارجاع: $returnDate', // عرض تاريخ الإرجاع
                            style: TextStyle(
                              fontSize: 16,
                              color: isDatePassed ? Colors.red : Colors.black,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
