import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class DotSwiper extends StatelessWidget {
  final List<String> images = [
    'assets/images/3.jpg',
    'assets/images/3.jpg',
    'assets/images/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        return Container(
          height: 200.0, // Specify the desired height
          child: Image.asset(
              'assets/images/3.jpg',
            fit: BoxFit.fill,
            
          ),
          
        );
      },
      itemCount: 3,
      itemWidth: 300.0,
      itemHeight: 200.0, // Adjust the item height to match the desired height
      layout: SwiperLayout.DEFAULT,
    );
  }
}
