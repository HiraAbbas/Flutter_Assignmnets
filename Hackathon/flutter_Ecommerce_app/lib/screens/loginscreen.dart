import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/firstscreen.dart';
import 'package:flutter_weather_app/screens/homescreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_weather_app/screens/signin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // User login successful, navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
      // Show an error message to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Error'),
          content: const Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
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
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/2.jpg',
              width: 130,
              height: 290,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 40, 50, 35),
              width: 342,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(27),
                boxShadow: [
                   BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(2, 2),
                    blurRadius: 5,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 277,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color(0xfff0f0f0),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: 'Your Email',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Add additional validation logic for email format if needed
                        return null;
                      },
                    ),
                  ),
                   SizedBox(height: 20),
                  Container(
                    width: 277,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color(0xfff0f0f0),
                    ),
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: passwordController,
                      decoration:  InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                       // labelText: 'Password',
                        prefixIcon:  Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Add additional validation logic for password complexity if needed
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 145,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(2, 4),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2f08cd),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homescreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login ",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(
                          color: Color(0xff4a4242),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 201,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(2, 4),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ],
                      color: const Color(0xff3009cd),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2f08cd),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login with Phone",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 134,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
        ),
      ),
    );
  }
}
