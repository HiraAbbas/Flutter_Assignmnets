import 'package:flutter/material.dart';
import 'package:instagram_profile_ui/views/profile_sec.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
  
       home:const Profile(),
    );
  }
}
