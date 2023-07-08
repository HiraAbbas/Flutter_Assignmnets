import 'package:flutter/material.dart';
//import 'package:flutter_application_firebase/controllers/home.controllers.dart';

import 'package:flutter_application_firebase/screens/accountScreen.dart';
import 'package:flutter_application_firebase/screens/cartScreen.dart';
import 'package:flutter_application_firebase/screens/categoryScreen.dart';
import 'package:flutter_application_firebase/screens/homeScreen.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({Key? key}) : super(key: key);

  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  int currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navbarItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Account"),
    ];
    var navBody = [
      Homescreen(),
      Categoryscreen(),
      Cartscreen(),
      Accountscreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: navBody.elementAt(currentNavIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNavIndex,
        items: navbarItems,
        selectedItemColor: Colors.lightBlue[900],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentNavIndex = value;
          });
        },
      ),
    );
  }
}
