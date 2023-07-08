// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'categoryScreenDetails.dart';

class itemsDetails extends StatelessWidget {
  final dynamic data;
  final String? title;
  final List<String> nameItems = [
    "Videos",
    "Reviews",
    "Seller Policy",
    "Return Policy",
    "Support Policy"
  ];
  int counter = 0; // Initial counter value
  double totalPrice = 0.0; // Initial total price

  itemsDetails({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price = double.parse(data['pro_price'].replaceAll(
        'Rs.', '')); // Remove "Rs." prefix and parse the string to double
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: title!.text
            .fontWeight(FontWeight.bold)
            .color(Colors.grey[850])
            .make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Swiper
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350,
                      viewportFraction: 1.0,
                      // enlargeCenterPage: true,
                      itemCount: data['pro_images'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['pro_images'][index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    title!.text
                        .fontWeight(FontWeight.bold)
                        .color(Colors.grey[850])
                        .size(18)
                        .make(),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['pro_rating']),
                      onRatingUpdate: (value) {},
                      normalColor: Colors.grey,
                      selectionColor: Colors.yellow,
                      maxRating: 5,
                      size: 25,
                      count: 5,
                    ),
                    10.heightBox,
                    Text(
                      data['pro_price'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['pro_seller'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                data['pro_brand'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: Colors.grey[850],
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(Colors.grey)
                        .make(),
                    //color selection
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Colors: ".text.color(Colors.grey).make(),
                            ),
                            Row(
                              children: List.generate(
                                data['pro_colors'].length,
                                (index) => VxBox()
                                    .size(20, 20)
                                    .roundedFull
                                    .color(Color(data['pro_colors'][index])
                                        .withOpacity(1.0))
                                    .margin(
                                      EdgeInsets.symmetric(horizontal: 6),
                                    )
                                    .make(),
                              ),
                            )
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        //quantity row

                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: "Quantity: "
                                    .text
                                    .color(Colors.grey)
                                    .make()),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (counter > 0) {
          counter--;
          totalPrice = price * counter;
        }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  counter.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[850],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Logic for increasing the counter and updating total price
                                    // Logic for increasing the counter and updating total price
                                   counter++;
        totalPrice = price * counter;
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                Text(
                                  data['pro_quantity'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[850],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(Colors.grey).make(),
                            ),
                            Text(
                              (price * counter).toStringAsFixed(
                                  2), // Display the dynamically calculated total price
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    //description
                    SizedBox(height: 10),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[850],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data['pro_description'],
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[850],
                      ),
                    ),
                    10.heightBox,
                    //buttons section
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        nameItems.length,
                        (index) => ListTile(
                          title: nameItems[index]
                              .text
                              .fontWeight(FontWeight.w500)
                              .color(Colors.grey[850])
                              .make(),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    20.heightBox,
                    "Products You May Also Like"
                        .text
                        .fontWeight(FontWeight.w500)
                        .size(16)
                        .color(Colors.grey[850])
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
                                fit: BoxFit.cover,
                                width: 150,
                              ),
                              10.heightBox,
                              "Laptop 4/64GB"
                                  .text
                                  .fontWeight(FontWeight.normal)
                                  .color(Colors.grey[850])
                                  .make(),
                              10.heightBox,
                              "\$6000"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .color(Colors.blue[900])
                                  .make(),
                            ],
                          )
                              .box
                              .color(Colors.white)
                              .roundedSM
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .padding(EdgeInsets.all(8.0))
                              .make(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: OurButton(
              color: Colors.red,
              textColor: Colors.white,
              onPress: () {},
              title: "Add to Cart",
            ),
          ),
        ],
      ),
    );
  }
}

class OurButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final String title;

  const OurButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
