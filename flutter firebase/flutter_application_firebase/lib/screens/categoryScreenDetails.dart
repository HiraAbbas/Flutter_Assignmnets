import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/buttons/widget%20indicator.dart';
import 'package:flutter_application_firebase/screens/itemsDetails.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  CategoryDetails({Key? key, required this.title}) : super(key: key);

  static Stream<QuerySnapshot> getProduct(String category) {
    String productsCollection = "products";

    return FirebaseFirestore.instance
        .collection(productsCollection)
        .where('pro_category', isEqualTo: category)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[850],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: getProduct(title!),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No products found",
                style: TextStyle(
                  color: Colors.grey[850],
                ),
              ),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        6,
                        (index) => Container(
                          width: 120,
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "baby clothing",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[850],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => itemsDetails(
                                  title:  data[index]['pro_name'], data: data[index],
                                  
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.all(12),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['pro_images'][0],
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 150,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  data[index]['pro_name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[850],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  data[index]['pro_price'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
