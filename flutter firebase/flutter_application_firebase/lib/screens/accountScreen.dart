import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/buttons/carddetails.dart';
import 'package:flutter_application_firebase/screens/editprofilescreen.dart';
import 'package:flutter_application_firebase/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class Accountscreen extends StatefulWidget {
  final List<String> accountStrings = ["My Wishlist", "My Orders", "Messages"];
  final List<IconData> accountIcons = [
    Icons.list_alt_rounded,
    Icons.list_alt_rounded,
    Icons.message
  ];

  Accountscreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<Accountscreen> {
  late User _currentUser;
  String? _imageUrl;
  final firebase_storage.Reference _storage =
      firebase_storage.FirebaseStorage.instance.ref();
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _fetchProfileImage();
    _fetchUserData();
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  Future<void> _fetchProfileImage() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.uid)
        .get();
    final data = snapshot.data();
    if (data != null) {
      setState(() {
        _imageUrl = data['profileImage'];
      });
    }
  }

  Future<void> _fetchUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.uid)
        .get();
    setState(() {
      _userData = snapshot.data();
    });
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageUrl = null; // Clear the previous image URL
      });

      final File imageFile = File(pickedFile.path);
      final String fileName =
          _currentUser.uid; // Use the user's UID as the file name
      final firebase_storage.Reference storageRef =
          _storage.child('images/$fileName');
      final firebase_storage.UploadTask uploadTask =
          storageRef.putFile(imageFile);
      final firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .update({
        'profileImage': imageUrl,
      });

      setState(() {
        _imageUrl = imageUrl; // Update the image URL
      });
    }
  }

  Future<void> _deleteProfileImage() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUser.uid)
        .update({
      'profileImage': null,
    });

    setState(() {
      _imageUrl = null; // Clear the image URL
    });
  }

  Future<void> _captureImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageUrl = null; // Clear the previous image URL
      });

      final File imageFile = File(pickedFile.path);
      final String fileName =
          _currentUser.uid; // Use the user's UID as the file name
      final firebase_storage.Reference storageRef =
          _storage.child('images/$fileName');
      final firebase_storage.UploadTask uploadTask =
          storageRef.putFile(imageFile);
      final firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .update({
        'profileImage': imageUrl,
      });

      setState(() {
        _imageUrl = imageUrl; // Update the image URL
      });
    }
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Camera'),
          onTap: () {
            _captureImageFromCamera();
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Gallery'),
          onTap: () {
            _getImageFromGallery();
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete'),
          onTap: () {
            _deleteProfileImage();
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildBottomSheetContent(context);
                        },
                      );
                    },
                  ),
                ),
                Row(
  children: [
    Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: _imageUrl != null
            ? DecorationImage(
                image: NetworkImage(_imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _currentUser.displayName != null
              ? Text(
                  _currentUser.displayName!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              : SizedBox(),
          _currentUser.email != null
              ? Text(
                  _currentUser.email!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              : SizedBox(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                      ),
                      onPressed: () => logout(context),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Detailscards(
                      count: _userData?['cart_count'],
                      title: "In your Cart",
                      width: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Detailscards(
                      count: _userData?['wishlist_count'],
                      title: "In your Wishlist",
                      width: MediaQuery.of(context).size.width / 3.2,
                    ),
                    Detailscards(
                      count: _userData?['order_count'],
                      title: "In your Orders",
                      width: MediaQuery.of(context).size.width / 3.2,
                    ),
                  ],
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilePickerDemo()),
                  ),
                  child: Text(
                    "filepicker",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[200],
                      );
                    },
                    itemCount: widget.accountStrings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(
                          widget.accountIcons[index],
                        ),
                        minLeadingWidth: 22,
                        title: Text(widget.accountStrings[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
