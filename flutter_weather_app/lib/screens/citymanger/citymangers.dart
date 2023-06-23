import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/citymanger/addscreen.dart';
import 'package:flutter_weather_app/screens/citymanger/editScreen.dart';
import 'package:flutter_weather_app/screens/citymanger/listview.dart';
import 'package:flutter_weather_app/screens/citymanger/navigationBar.dart';

class Citymanager extends StatelessWidget {
  const Citymanager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          "City Manager",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Container(
   child: 
        const MyListView(),
      ),
      bottomNavigationBar: CityManagerBottomNavigationBar(
        onEditPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Editscreen()));// Handle add button pressed// Handle edit button pressed
        },
        onAddPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Addscreen()));// Handle add button pressed
        },
      ),
    );
  }
}

