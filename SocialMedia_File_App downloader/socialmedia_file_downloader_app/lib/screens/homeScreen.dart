import 'package:flutter/material.dart';
import 'package:socialmedia_file_downloader_app/icons.dart';
import 'package:socialmedia_file_downloader_app/screens/downloadScreen.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
TextEditingController url = TextEditingController();
  double? _progress;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        title: const Text(
          "Social Downloader",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_sharp, color: Colors.black),
        ),
      ),
      body: Container(
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 24,
                            height: 24,
                          ),
                          Expanded(
                            child: TextFormField(
                             controller: url,
                              decoration: const InputDecoration(
                                hintText: 'Enter URL here...',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.link,color: Colors.black),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: 0.5,
                                color: Color(0xff44474f),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                      FileDownloader.downloadFile(
                          url: url.text.trim(),
                          onProgress: (name, progress) {
                            setState(() {
                              _progress = progress;
                            });
                          },
                          onDownloadCompleted: (value) {
                            print('path  $value ');
                            setState(() {
                              _progress = null;
                            });
                          });
                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff005ac1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Text(
                              'GO',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.4285714286,
                                letterSpacing: 0.1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                           const SizedBox(height: 16),
                           
           
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
  items: [
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          // Handle the home icon tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ),
          );
        },
        child: Icon(Icons.home),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          // Handle the downloads icon tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Downloadscreen(),
            ),
          );
        },
        child: Icon(Icons.message_outlined),
      ),
      label: 'Whatsapp',
    ),
     BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          // Handle the downloads icon tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Downloadscreen(),
            ),
          );
        },
        child: Icon(Icons.download),
      ),
      label: 'Downloads',
    ),
    // Add more BottomNavigationBarItems here if needed
  ],
  // Additional properties for the BottomNavigationBar
),

    );
  }
}
