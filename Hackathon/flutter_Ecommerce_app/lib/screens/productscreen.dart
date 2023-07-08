import 'package:flutter/material.dart';
import 'package:flutter_weather_app/swipper/swipper.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key, required String itemTitle, required String itemPrice}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<Productscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
         SizedBox(height: 1),
          Expanded(
            child: DotSwiper(),
          ),
          SizedBox(height: 10),
          Text(
            'Perfect Situation Purple Long Sleeve Dress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '\$25.99',
            style: TextStyle(fontSize: 16, color: Color.fromRGBO(48, 9, 205, 1)),
          ),
          SizedBox(height: 10),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Info',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Measurement',
                  style: TextStyle(color: Colors.black),
                
              ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InfoPage(),
                MeasurementPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "AS SEEN IN REDBOOK! You'll be primed and ready in the Perfect Situation Purple Long Sleeve Shift Dress when everything starts falling into place! This woven poly dress has a casual shift shape, accented by a rounded neckline.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class MeasurementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Measurement Page'),
      ),
    );
  }
}
