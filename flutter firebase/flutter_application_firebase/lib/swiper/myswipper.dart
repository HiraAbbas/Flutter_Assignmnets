import 'package:flutter/material.dart';

class MySwiper extends StatefulWidget {
  @override
  _MySwiperState createState() => _MySwiperState();
}

class _MySwiperState extends State<MySwiper> {
  final List<String> items = [
    "https://www.foodengineeringmag.com/ext/resources/2023/02/17/7up_Reg___Zero_Stubby_Cans.jpg?1676665745",
    "colors.grey",
    "",
    "",
    ""
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set the desired height for the swiper
      child: PageView.builder(
        
        itemCount: items.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            // Display an image for the first item
            return Image.network(
              items[index],
              fit: BoxFit.cover,
            );
          } else {
            // Display text for the rest of the items
            return Container(
              alignment: Alignment.center,
              child: Text(
                items[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
