// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/hourly_weather_model.dart';
import 'package:flutter_weather_app/screens/citymanger/citymangers.dart';
import 'package:flutter_weather_app/screens/settingsscreen.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);

  Future<void> _openWeatherWebsite() async {
  const url = 'https://www.weather.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        title: Text(
          "Karachi",
          style: TextStyle(color: Colors.grey[800], fontSize: 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Citymanager()),
              );
            },
            icon: Icon(
              Icons.location_city,
              color: Colors.grey[800],
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[700],
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
          

          Stack(
            children: [
              Image.asset(
                'assets/icons/cloudyDay.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height / 1.77,
                width: MediaQuery.of(context).size.width / 1,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Positioned(
                bottom: 0,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "24°",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 76,
                      ),
                    ),
                    Text(
                      "Fair",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "24°/28° C",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              height: 135,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${index + 1}:00",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Icon(
                          Icons.cloud,
                          color: Colors.grey[800],
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "24°",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Level 3",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "WSW",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "76%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Humidity",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "36°",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Feels like",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        const Divider(),
          Stack(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (context, index) {
                  var day = DateFormat("MM/dd EEE")
                      .format(DateTime.now().add(Duration(days: index + 1)));
                  return Container(
                    
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          
                          Icons.cloud,
                          color: Colors.grey[800],
                          size: 30,
                        ),
                        Text(
                          "24/34°",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
             
            ],
            
          ),
        
         const Divider(),
const SizedBox(height: 10),
GestureDetector(
  onTap: _openWeatherWebsite, // Open weather.com webpage
  child: const Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded( 
        //color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0), // Add left padding
          child: Text(
            "More Weather Forecast",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
  
      // Add left padding
        Icon(
          Icons.keyboard_arrow_right,
          size: 25,
        
        ),
    ]
      ),

      ),
      const SizedBox(height: 10),
const Divider(),
    ],
  ),
  
),

      
        
      
    );
  }
}