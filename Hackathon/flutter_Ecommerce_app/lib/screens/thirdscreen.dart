import 'package:flutter/material.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/5.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 0,
            child: Container(
              margin: const EdgeInsets.fromLTRB(169, 56, 0.83, 330.0),
              width: 24.17,
              height: 29,
              child: Image.asset(
                'assets/images/0.png',
                width: 24.17,
                height: 29,
              ),
            ),
          ),
          Positioned(
            left: 32,
            top: 386,
            child: Container(
              width: 100,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 17, 9, 0),
                    child: const Text(
                      'NO',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 2,
                        letterSpacing: -0.3,
                        decoration: TextDecoration.underline,
                        color: Color(0xffffffff),
                        decorationColor: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const Text(
                    '3',
                    style: TextStyle(
                      fontFamily: 'Abril Fatface',
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      height: 1.3475,
                      letterSpacing: -0.3,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 31,
            top: 460,
            child: Align(
              child: SizedBox(
                width: 150,
                height: 29,
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    height: 1.175,
                    letterSpacing: -0.3,
                    color: Color(0xff2f08cd),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 31,
            top: 490,
            child: Align(
              child: SizedBox(
                width: 211,
                height: 70,
                child: Text(
                  'Tailored ',
                  style: TextStyle(
                    fontFamily: 'Abril Fatface',
                    fontSize: 51.8421058655,
                    fontWeight: FontWeight.w700,
                    height: 1.3475,
                    letterSpacing: -0.3,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(31, 569, 0, 21),
            constraints: const BoxConstraints(
              maxWidth: 324,
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.7375200272,
                  letterSpacing: -0.3,
                  color: Color(0xff2f08cd),
                ),
                children: [
                  TextSpan(
                       text: 'Christain Lobi',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.739,
                      letterSpacing: -0.3,
                      color: Color(0xffffffff),
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.739,
                      letterSpacing: -0.3,
                      color: Color(0xff2f08cd),
                    ),
                  ),
                  TextSpan(
                      text: 'showing us his new summer beach wears',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1.739,
                      letterSpacing: -0.3,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 658,
            left: 32,
            child:
          
          ElevatedButton(
  style: ElevatedButton.styleFrom(
    fixedSize: const Size(308, 65),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: Colors.white,
      width: 2,
    )
  ),
  onPressed: () {
    // Add your button click logic here
  },
  child: const Text(
    'Shop Now',
    style: TextStyle(
      fontFamily: 'Raleway',
      fontSize: 24,
      fontWeight: FontWeight.w800,
      height: 1.175,
      letterSpacing: -0.3,
      color: Color(0xffffffff),
    ),
  ),
),
          ),
         
        ],
      ),
    );
  }
}

