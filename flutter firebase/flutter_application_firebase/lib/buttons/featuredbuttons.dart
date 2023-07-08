import 'package:flutter/material.dart';

const featuredlist1 = ["WomenDress", "GirlsDress", "Watches"];
const featuredlist2 = ["MenDress", "BoysDress", "Watches"];
const featuredimages1 = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU"
];
const featuredimages2 = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU"
];

Widget featuredButtons({String? label, required String icon}) {
  return Container(
    width: 200,
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    ),
    padding: EdgeInsets.all(4),
    child: Row(
      children: [
        Image.network(
          icon,
          fit: BoxFit.fill,
          width: 60,
        ),
        SizedBox(width: 10),
        Text(
          label!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
