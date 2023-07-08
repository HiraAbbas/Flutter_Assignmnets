import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String usersCollection = 'users'; // Define the collection name

storeUserData({String? firstname, String? lastname, String? email}) async {
  User? currentUser = FirebaseAuth.instance.currentUser; // Get the current user

  if (currentUser != null) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser.uid);
    store.set({
      "Firstname": firstname,
      "Lastname": lastname,
      "email": email,
      "imageurl": "",
      "Id": currentUser.uid,
    });
  }
}
