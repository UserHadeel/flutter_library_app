// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:library_app/common/color_extantion.dart';
// import 'package:library_app/controllers/BookLoanController.dart';
// import 'package:library_app/models/book_loan_model.dart';
// import 'package:library_app/models/book_model.dart';

// class LoanView extends StatelessWidget {
//   final DateTime returnDate;
//   LoanView({Key? key, required this.returnDate}) : super(key: key);
//   BookLoanController controller =Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'الكتب المستعارة',
//           style: TextStyle(
//             fontSize: 23,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: TColor.primary,
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         centerTitle: true,
//       ),
//       body: GetBuilder<BookLoanController>(
//         init: BookLoanController(),
//         builder: (controller) {
//           if (controller.isLoading.value) {
//             return Center(
//               child: CircularProgressIndicator(color: TColor.primary,),
//             );
//           } else {
//             return Container(
//               margin: const EdgeInsets.only(top: 50),
//               child: ListView.separated(
//                 itemCount: controller.bookLoanList.length,
//                 separatorBuilder: (BuildContext context, int index) => Divider(
//                   color: TColor.primary,
//                   thickness: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   final  bookLoan = controller.bookLoanList[index];
                
//                 final String returnDate = bookLoan.returnDate.toString() ?? 'غير محدد';

//                   final bool isDatePassed =
//                       DateTime.now().isAfter(DateTime.parse(returnDate));

//                   return ListTile(
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           isDatePassed ? Icons.warning : Icons.check_circle,
//                           color: isDatePassed ? Colors.red : Colors.green,
//                         ),
                      
//                       ],
//                     ),
//                     subtitle: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const SizedBox(width: 8),
//                         Flexible(
//                           child: Text(
//                             'تاريخ الارجاع: ${bookLoan.returnDate}',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: isDatePassed ? Colors.red : Colors.black,
//                             ),
//                             textAlign: TextAlign.right,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }