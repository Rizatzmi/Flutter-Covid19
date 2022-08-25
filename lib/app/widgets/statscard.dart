import 'package:flutter/material.dart';

Widget statsCard(
  Color color,
  String title,
  String content,
  String subcontent,
) {


  return Container(
    width: 200,
    height: 110,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
          const SizedBox(height: 3),
          Text(
            subcontent,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontFamily: "Poppins"),
          )
        ],
      ),
    ),
  );
}