import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageReference {
  const FirebaseStorageReference();

  static Reference shopProfile =
      FirebaseStorage.instance.ref().child('shop_profile');
}
