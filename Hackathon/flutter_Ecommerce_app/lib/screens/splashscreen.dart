import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/pageView.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageViewScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f08cd),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
           SizedBox(height: 60),
              Image.asset(
                'assets/images/0.png',
                width: 200,
                height: 200,
                scale: 0.66,
                
              ), 
           // SizedBox(height: 20), 
            //Text(
              //'I-TAILOR',
              //style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            //),
            SizedBox(height: 50),
            CircularProgressIndicator(), // Add any custom loading indicator here
          ],
        ),
      ),
    );
  }
}
