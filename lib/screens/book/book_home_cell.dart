import 'package:flutter/material.dart';

class BookHomeCell extends StatelessWidget {

  final String image;
  final String title;
  final String author;
  const BookHomeCell({super.key, required this.image, required this.title, required this.author,});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      width: media.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                height: media.width * 0.44,
                // width: 200,
                width: media.width * 0.45,
                // height: media.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            author,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
