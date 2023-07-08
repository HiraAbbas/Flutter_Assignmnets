import 'package:flutter/material.dart';
import 'package:socialmedia_file_downloader_app/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.grey[850],
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      
      home: const Homepage(),
    );
  }
}

