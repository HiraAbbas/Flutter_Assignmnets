import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/loginscreen.dart';

class CreateAccountPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _createAccount(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Account creation successful, navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Handle account creation errors
      print('Account creation error: $e');
      // Show an error message to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Account Creation Error'),
          content: Text('Failed to create an account. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/images/2.jpg',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Container(
                width: 381,
                height: 434,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x40000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                  color: const Color(0xffffffff),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 45),
                    Container(
                      width: 277,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff0f0f0),
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Your Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 277,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff0f0f0),
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    Container(
                      width: 145,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x40000000),
                            offset: Offset(2, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          )
                        ],
                        color: const Color(0xff3009cd),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _createAccount(context);
                        },
                        child: Text(
                          "Create Account",
                          style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 130.5,
                height: 1,
                decoration: BoxDecoration(
                  color: const Color(0xe0b09f9f),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}