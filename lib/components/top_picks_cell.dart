// // import 'package:flutter/material.dart';
// // // import 'package:library_app/common/color_extantion.dart';

// // class TopPicksCell extends StatelessWidget {
// //   final Map iObj;
// //   const TopPicksCell({super.key, required this.iObj});

// //   @override
// //   Widget build(BuildContext context) {
// //     var media = MediaQuery.of(context).size;
// //     return SizedBox(
// //       width: media.width * 0.45,
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(15),
// //               boxShadow: const [
// //                 BoxShadow(
// //                   color: Colors.black12,
// //                   offset: Offset(0, 2),
// //                   blurRadius: 3,
// //                 ),
// //               ],
// //             ),
// //             child: ClipRRect(
// //               borderRadius: BorderRadius.circular(15),
// //               child: Image.asset(
// //                 iObj["image"].toString(),
// //                 height: media.width * 0.54,
// //                 width: 187,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),

// //           const SizedBox(
// //             height: 15,
// //           ),

// //           Text(
// //             iObj["name"].toString(),
// //             maxLines: 3,
// //             textAlign: TextAlign.center,
// //             style: const TextStyle(
// //               color: Colors.black,
// //               fontSize: 15,
// //               fontWeight: FontWeight.w700,
// //             ),
// //           ),
// //           // Text(iObj["author"].toString(),
// //           // maxLines: 1,
// //           //     style: TextStyle(
// //           //   color: TColor.subTitle,
// //           //   fontSize: 13,
// //           // ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class TopPicksCell extends StatelessWidget {
//   final Map iObj;
//    final TextButton? button;


//   const TopPicksCell({Key? key, required this.iObj, this.button}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return SizedBox(
//       width: media.width * 0.45,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   offset: Offset(0, 2),
//                   blurRadius: 3,
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     iObj["image"].toString(),
//                     height: media.width * 0.55,
//                     width: 187,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 // if (button != null)
//                 //   Container(
//                 //     width: double.infinity,
//                 //     child: button,
//                 //   ),
//               ],
//             ),
//           ),
//           if (button != null)
//                   Container(
//                     width: double.infinity,
//                     child: button,
//                   ),
//           const SizedBox(
//             height: 15,
//           ),
//           // Text(
//           //   iObj["name"].toString(),
//           //   maxLines: 3,
//           //   textAlign: TextAlign.center,
//           //   style: const TextStyle(
//           //     color: Colors.black,
//           //     fontSize: 15,
//           //     fontWeight: FontWeight.w700,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }