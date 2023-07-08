import 'package:flutter/material.dart';



class FourthScreen extends StatefulWidget {
 const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/6.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 77,
            top: 0,
            child: Container(
              width: 375,
              height: 520,
              decoration: const BoxDecoration(
                color: Color(0xffe3e3e3),
              ),
              child: Center(
                child: SizedBox(
                  width: 375,
                  height: 520,
                  child: Image.asset(
                   "assets/images/3.jpg" ,
                    width: 375,
                    height: 520,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
  top: 547,
  left: 25,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(310, 65),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: Colors.transparent,
       side: const BorderSide(
        color: Colors.white, // Border color
        width: 2, // Border width
      ),
    
    ),
    onPressed: () {
      // Add your button click logic here
    },
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
      Icons.camera_alt, 

  color: Colors.white,
        ),
        SizedBox(width: 8),
        Text(
          'Continue with Instagram',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.175,
            letterSpacing: -0.3,
            color: Color(0xffffffff),
          ),
        ),
      ],
    ),
  ),
),
Container(
            margin: const EdgeInsets.fromLTRB(28, 627, 0, 21),
            constraints: const BoxConstraints(
              maxWidth: 324,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.7375200272,
                  letterSpacing: -0.3,
                  color: Color(0xff2f08cd),
                ),
                children: [
                  const TextSpan(
                    text: 'By clicking this button you agree to our ',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.5,
                      fontWeight: FontWeight.w400,
                      height: 1.739,
                      letterSpacing: -0.4,
                      color: Color(0xffffffff),
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        // Add your logic to navigate to the Terms of Service page
                      },
                      child: const Text(
                        'terms of service',
                        style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.5,
                      fontWeight: FontWeight.w400,
                      height: 1.739,
                      letterSpacing: -0.4,
                      color: Color(0xffffffff),
                 decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.5,
                      fontWeight: FontWeight.w400,
                      height: 1.739,
                      letterSpacing: -0.4,
                      color: Color(0xffffffff),
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        // Add your logic to navigate to the Privacy Policy page
                      },
                      child: const Text(
                        'privacy policy',
                        style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18.5,
                      fontWeight: FontWeight.w400,
                      height: 1.739,
                      letterSpacing: -0.4,
                      color: Color(0xffffffff),
                 decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

         
        ],
      ),
    );
  }
}
