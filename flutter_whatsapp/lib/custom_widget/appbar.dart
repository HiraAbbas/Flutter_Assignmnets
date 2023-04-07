import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/custom_widget/chats_tabs.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff128C7E),
          child: const Icon(Icons.message),
        ),
        appBar: AppBar(
          title: const Text("WhatsApp"),
          backgroundColor: const Color(0xff128C7E),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            //indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: const Color.fromRGBO(18, 140, 126, 1),
            tabs: [
              Tab(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt_rounded),
                ),
              ),
              const Tab(
                child: Text(
                  "CHATS",
                  style: TextStyle(
                    // fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Tab(
                child: Text(
                  "STATUS",
                  style: TextStyle(
                    // fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Tab(
                child: Text(
                  "CALLS",
                  style: TextStyle(
                    //fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: const TabBarView(children: [
          Center(child: Text('This feature is coming soon')),
          ChatsTab(),
          Center(child: Text('Status feature is coming soon')),
          Center(child: Text('Call feature is coming soon')),
        ]),
      ),
    );
  }
}
