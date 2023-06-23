import 'package:flutter/material.dart';
import 'package:flutter_weather_app/consts/colors.dart';
import 'package:flutter_weather_app/consts/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey[700],),
        ),
        title: Text(
          'Settings',
          style: TextStyle(color:Colors.grey[700] ),
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: 
      
       ListView(
        children: [
          ListTile(
            title: Text(s1),
            onTap: () {
              // Handle List Tile 1 tap
            },
          ),
          ListTile(
            title: Text(s2),
            onTap: () {
              // Handle List Tile 2 tap
            },
          ),
          ListTile(
            title: Text(s3),
            onTap: () {
              // Handle List Tile 3 tap
            },
          ),
          ListTile(
            title: Text(s4),
            onTap: () {
              // Handle List Tile 4 tap
            },
          ),
          ListTile(
            title: Text(s5),
            onTap: () {
              // Handle List Tile 5 tap
            },
          ),
          ListTile(
            title: Text(s6),
            onTap: () {
              // Handle List Tile 6 tap
            },
          ),
        ],
      ),
      ),
    );
  }
}
