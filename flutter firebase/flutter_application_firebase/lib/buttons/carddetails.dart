import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Detailscards({required double width, String? count, String? title}) {
  return Container(
    width: width,
    height: 80,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[850],
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title!,
          style: TextStyle(
            color: Colors.grey[850],
          ),
        ),
      ],
    ),
  );
}
