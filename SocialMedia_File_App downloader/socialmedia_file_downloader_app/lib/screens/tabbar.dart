import 'package:flutter/material.dart';

class tabbar extends StatefulWidget {
  const tabbar({super.key});

  @override
  State<tabbar> createState() => _tabbarState();
  
}

class _tabbarState extends State<tabbar> 
  
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
    
      body: Column(
        children: 
         
        [
            
          
         
          SizedBox(height: 10),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Images',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  ("Videos"),
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



/*Container(
        color: Colors.white,
        //red
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 20,
              child: Container(
                width: 380,
                height: 485,
                color: Colors.white,
                //amber
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      width: double.infinity,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                     
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Supported Apps & Websites",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff44474f),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GridView.count(
                                  crossAxisCount: 4,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(12, (index) {
                                    final iconData = socialMediaIcons[index % socialMediaIcons.length];
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: EdgeInsets.zero,
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.amber
                                      ),
                                      child: Icon(
                                        iconData['icon'],
                                        size: 50,
                                        // color: Colors.white,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text(
                                "More apps and websites coming soon...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff44474f),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
        selectedFontSize: 14,
  unselectedFontSize: 14,
  selectedItemColor: Colors.blue[400],
  unselectedItemColor: Colors.grey[500],
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.blue[100],
  elevation: 5,
  selectedIconTheme: IconThemeData(size: 28),
  unselectedIconTheme: IconThemeData(size: 28),
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),

      ),
    );
  }
}
*/
