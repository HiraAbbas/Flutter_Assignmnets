import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              'manahil1426',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            iconSize: 30,
            onPressed: () {
              // Handle add button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30,
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                    ),
                  ],
                ),
                Column(
                  children: const [
                    SizedBox(height: 16),
                    Text(
                      '3.6K',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Posts'),
                  ],
                ),
                Column(
                  children: const [
                    SizedBox(height: 16),
                    Text(
                      '5.2M',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: const [
                    SizedBox(height: 16),
                    Text(
                      '982',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Manahil Shah',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Personal blog',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // other widgets here
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade800),
                    //   fixedSize: MaterialStateProperty.all(Size(100, 8)),
                  ),
                  onPressed: () {
                    // handle button press
                  },
                  child: const Text('Edit Profile'),
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade800),
                    // fixedSize: MaterialStateProperty.all(Size(100, 8)),
                  ),
                  onPressed: () {
                    // handle button press
                  },
                  child: const Text('Share Profile'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade800),
                    fixedSize: MaterialStateProperty.all(const Size(100, 8)),
                  ),
                  onPressed: () {
                    // handle button press
                  },
                  child: const Text('Email'),
                ),
                // other widgets here
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // other widgets here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Story highlights',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // handle down arrow button press
                      },
                      icon: const Icon(Icons.keyboard_arrow_up),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Keep your favorite stories on your profile',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.values.first,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: const BorderSide(color: Colors.white),
                        fixedSize: const Size(60, 60),
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: BorderSide(color: Colors.grey.shade800),
                        backgroundColor: Colors.grey.shade800,
                        fixedSize: const Size(60, 60),
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Row(),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: BorderSide(color: Colors.grey.shade800),
                        backgroundColor: Colors.grey.shade800,
                        fixedSize: const Size(60, 60),
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Row(),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: BorderSide(color: Colors.grey.shade800),
                        backgroundColor: Colors.grey.shade800,
                        fixedSize: const Size(60, 60),
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: Row(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // add a SizedBox to create space between the button and text
                const Text(
                  "        New",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
