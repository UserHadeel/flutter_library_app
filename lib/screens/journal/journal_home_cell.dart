import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';

class JournalHomeCell extends StatelessWidget {
  final Map jObj;
  const JournalHomeCell({super.key, required this.jObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      //  color: const Color.fromARGB(255, 246, 230, 245),
      width: media.width * 0.6,
      // height: media.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
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
              child: Image.asset(
                jObj["image"].toString(),
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
            jObj["title"].toString(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black12,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            jObj["description"].toString(),
            maxLines: 1,
            style: TextStyle(
              color: TColor.subTitle,
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
