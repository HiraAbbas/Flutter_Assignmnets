import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:azlistview/azlistview.dart';

class City implements ISuspensionBean {
  String name;

  City(this.name);

  @override
  String getSuspensionTag() {
    return name.substring(0, 1);
  }

  @override
  bool get isShowSuspension => true;

  @override
  set isShowSuspension(bool value) {}
}

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  _AddscreenState createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  List<City> cities = [];

  Future<void> fetchCities(String cityName) async {
    final apiKey = '672a25fc14f82103a5c8f312fbbc5e0f'; // Replace with your OpenWeather API key
    final url =
        'https://api.openweathermap.org/data/2.5/find?q=$cityName&type=like&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> cityList = data['list'];

      final List<City> fetchedCities = cityList.map<City>((cityData) {
        return City(cityData['name']);
      }).toList();

      setState(() {
        cities = fetchedCities;
      });
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          "Add city",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: TextField(
              onChanged: (value) => fetchCities(value),
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              cursorWidth: 1.0,
            ),
          ),
          Expanded(
            child: AzListView(
              data: cities,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return ListTile(
                  title: Text(city.name),
                  onTap: () {
                    // Handle tapping on the list item here
                  },
                );
              },
              physics: BouncingScrollPhysics(),
              susItemBuilder: (context, index) {
                return ListTile(
                  title: Text(cities[index].getSuspensionTag()),
                  tileColor: Colors.grey[300],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
