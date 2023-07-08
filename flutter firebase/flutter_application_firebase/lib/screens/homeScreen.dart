import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/buttons/featuredbuttons.dart';
import 'package:flutter_application_firebase/buttons/homebuttons.dart';
import 'package:velocity_x/velocity_x.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final List<String> items = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
    // "https://images.unsplash.com/photo-1628229200053-53b768c4d37b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmV2YXJhZ2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60",
    //"https://images.unsplash.com/photo-1629325288097-55f028c6a159?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmV2YXJhZ2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60",
    //"https://images.unsplash.com/photo-1595670322505-4de61b9cdf47?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
    //"https://images.unsplash.com/photo-1501959915551-4e8d30928317?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
    //"https://images.unsplash.com/photo-1551636898-47668aa61de2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=400&q=60",
    //"https://images.unsplash.com/photo-1544787219-7f47ccb76574?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=400&q=60",
    //"https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=400&q=60",
    //"https://images.unsplash.com/photo-1443131307017-4097c8ac7763?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=400&q=60",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[200],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
          child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: Colors.grey[100],
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.white,
                hintText: "Search Anything",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        items[index],
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: homeButtons(
                          width: context.screenWidth / 2,
                          // height: context.screenHeight / 5.5,
                          iconData: Icons.local_offer,
                          label: "Today's Deals",
                        ),
                      ),
                      Expanded(
                        child: homeButtons(
                          width: context.screenWidth / 2,
                          //height: context.screenHeight / 5.5,
                          iconData: Icons.flash_on,
                          label: "Flash Sale",
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        items[index],
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: homeButtons(
                          width: context.screenWidth / 3.0,
                          //height: context.screenHeight / 5.5,
                          iconData: Icons.local_offer,
                          label: "Today's Deals",
                        ),
                      ),
                      Expanded(
                        child: homeButtons(
                          width: context.screenWidth / 3.0,
                          //height: context.screenHeight / 5.5,
                          iconData: Icons.local_offer,
                          label: "Today's Deals",
                        ),
                      ),
                      Expanded(
                        child: homeButtons(
                          width: context.screenHeight * 0.17,
                          //height: context.screenHeight / 5.5,
                          iconData: Icons.local_offer,
                          label: "Today's Deals",
                        ),
                      ),
                    ],
                  ),
                  //featured catogeries
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Featured Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        //color: Colors.blue,
                      ),
                    ),
                  ),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            featuredButtons(
                              icon: featuredimages1[0],
                              label: featuredlist1[index],
                            ),
                            10.heightBox,
                            featuredButtons(
                              icon: featuredimages2[0],
                              label: featuredlist2[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.heightBox,
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("FeaturedProducts",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
                                          fit: BoxFit.cover,
                                          width: 150,
                                        ),
                                        10.heightBox,
                                        "Laptop4/64GB"
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
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 4))
                                        .padding(EdgeInsets.all(8.0))
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Third swiper
                  20.heightBox,
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        items[index],
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  //all products
                  20.heightBox,
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          // mainAxisAlignment:
                          //   MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf-LA2CktmnrA6s668VrYQEtHFYu9OoisaVw&usqp=CAU",
                              fit: BoxFit.fill,
                              width: 200,
                              height: 200,
                            ),
                            Spacer(),
                            10.heightBox,
                            "Laptop4/64GB"
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
                            .padding(EdgeInsets.all(12.0))
                            .make();
                      }),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
