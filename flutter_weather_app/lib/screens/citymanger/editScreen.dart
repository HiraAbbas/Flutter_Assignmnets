import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/citymanger/editlistview.dart';



class Editscreen extends StatelessWidget {
  const Editscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          "Add city",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Container(
        child: ListEditview(),
      )
      );
  }
}

