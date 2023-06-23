import 'package:flutter/material.dart';

import 'package:flutter_weather_app/screens/weatherScreen.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( iconTheme: IconThemeData(color: Colors.grey[700]),),
      
      debugShowCheckedModeBanner: false,
      home: const Mainscreen(),
      title: "Weather App",
    );
  }
}
