import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/screens/categoryScreenDetails.dart';

const categoryImages = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
];
const categorylabel = [
  "Electronics",
  "Clothing",
  "Home & Kitchen",
  "Beauty & Personal Care",
  "Sports & Outdoors",
  "Books & Stationery",
  "Health & Wellness",
  "Toys & Games",
  "Automotive",
];

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 200,
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
                        builder: (context) =>
                            CategoryDetails(title: categorylabel[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(
                        categoryImages[index],
                        fit: BoxFit.cover,
                        width: 200,
                        height: 110,
                      ),
                      SizedBox(height: 10),
                      Text(
                        categorylabel[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[850],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
