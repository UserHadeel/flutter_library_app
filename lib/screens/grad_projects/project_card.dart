import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/screens/loanform/form_page.dart';

class ProjectCardItemWidget extends StatefulWidget {
  final String image;
  final String title;
  final String studentName;
  final String year;

  const ProjectCardItemWidget({super.key, 
    required this.image,
    required this.title,
    required this.studentName,
    required this.year,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProjectCardItemWidgetState createState() => _ProjectCardItemWidgetState();
}

class _ProjectCardItemWidgetState extends State<ProjectCardItemWidget> {
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
                  'http://10.0.2.2:8000/api/project',
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
                        widget.studentName,
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
                        widget.year,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>  FormPage(email: 'email',),
                            //   ),
                            // );
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
                          onPressed: () {
                            // تنفيذ العملية المطلوبة عند الضغط على زر التحميل
                          },
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