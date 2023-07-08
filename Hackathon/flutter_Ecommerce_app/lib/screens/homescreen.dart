import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/cartscreen.dart';
import 'package:flutter_weather_app/screens/productscreen.dart';

final categorylabel = [
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
  "White strap plunge top",
];
final category2label = [
  '\$25.99',
  '\$25.99',
  '\$25.99',
  '\$25.99',
  '\$25.99',
  '\$25.99',
  '\$25.99',
  '\$25.99',
];

class Homescreen extends StatelessWidget {
  Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            filled: true,
            suffixIcon: Icon(Icons.search, color: Colors.grey),
            fillColor: Colors.white,
            hintText: "Search Anything",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/2.jpg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 350,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAlias,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productscreen(
                            itemTitle: categorylabel[index],
                            itemPrice: category2label[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/3.jpg',
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 10),
                        Text(
                          categorylabel[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[850],
                          ),
                        ),
                           SizedBox(height: 10),
                        Text(
                          category2label[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[850],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart,size: 20,),
                          onPressed: () {
                            // Add item to cart functionality
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            label: "Account",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
        },
      ),
    );
  }
}
