import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/homecontroller.dart';
import 'package:flutter_weather_app/model/model.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> addedItems = []; // List to store the added items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: FutureBuilder(
        future: getuserList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${snapshot.data[index]['name']}"),
                  // subtitle: Text("${myuser.email}"),
                  // trailing: Text("${myuser.age}"),
                );
              },
            );
          } else {
            // Data is loading or an error occurred
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
