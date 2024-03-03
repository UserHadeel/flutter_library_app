import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/controllers/BookController.dart';
import 'package:library_app/screens/loanform/form_page.dart';

class CardItemWidget extends StatefulWidget {
  final String image;
  final String title;
  final String author;
  final String description;
  final int index;

   CardItemWidget({super.key, 
    required this.image,
    required this.title,
    required this.author,
    required this.description, required this.index,
  });

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}


AuthController controller =Get.find();
BookController bookcontroller =Get.find();


class _CardItemWidgetState extends State<CardItemWidget> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  'http://10.0.2.2:8000/api/book',
                  fit: BoxFit.cover,
                  height: 60.0,
                  width: 60.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.author,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('Email: ${controller.auth[0].data!.email.toString()}');
                            print('Book ID: ${bookcontroller.bookList[widget.index].id.toString()}');
                            print('User ID: ${controller.auth[0].data!.id.toString()}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  FormPage(
                                  
                                  bookId:bookcontroller.bookList[widget.index].id.toString(),
                                  user_id: controller.auth[0].data!.id.toString(),
                                  email: controller.auth[0].data!.email.toString(),
                                  
                                  ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                          ),
                          child: Text(
                            'استعارة',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: TColor.primary),
                          ),
                        ),
                        const SizedBox(width: 1.3),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                          ),
                          child: Text(
                            'تحميل',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: TColor.primary),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}