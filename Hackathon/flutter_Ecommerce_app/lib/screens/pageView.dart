import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/firstscreen.dart';
import 'package:flutter_weather_app/screens/forthscreen.dart';

import 'package:flutter_weather_app/screens/secondscreen.dart';
import 'package:flutter_weather_app/screens/thirdscreen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  final List<Widget> _screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) => _screens[index],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width / _screens.length,
                    height: 4.5,
                  decoration: BoxDecoration(
   color: Colors.grey, 
    borderRadius: BorderRadius.circular(12),
  ),
                   // color: Colors.grey, // Customize the color of the underline
                    margin: EdgeInsets.only(
                      left: _currentPageIndex *
                          (MediaQuery.of(context).size.width / _screens.length),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _screens.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 11.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPageIndex == i ?     Color(0xff2f08cd): Colors.grey,
            ),
          ),
        ),
      );
    }
    return indicators;
  }
}

