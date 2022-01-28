import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  const FirestoreCollection();

  static CollectionReference shop =
      FirebaseFirestore.instance.collection('Shop');
  static CollectionReference category =
      FirebaseFirestore.instance.collection('Category');
}
