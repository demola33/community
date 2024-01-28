import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirestoreServices._internal();

  static FirestoreServices get instance => FirestoreServices._internal();

  factory FirestoreServices() {
    return instance;
  }

  static CollectionReference userCollection = firestore.collection('users');
  static CollectionReference storyCollection = firestore.collection('stories');
}
