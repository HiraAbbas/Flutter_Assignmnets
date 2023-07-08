import 'package:flutter/material.dart';

Widget homeButtons({
  required double width,
  required IconData iconData,
  required String label,
}) {
  return Expanded(
    child: Container(
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
          Icon(
            iconData,
            color: Colors.blue[700],
            size: 26,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[850],
            ),
          ),
        ],
      ),
    ),
  );
}
