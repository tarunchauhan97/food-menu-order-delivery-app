import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class SaveImageFirebase {
  late final _storage;

  SaveImageFirebase() {
    _storage = FirebaseStorage.instance;
  }
  Future<String> saveImage(
      {required String imagePath, required String imageName}) async {
    late String imageURL;
    var snapshot = await _storage.ref();
    await _storage
        .ref()
        .child(imageName + "/image")
        .putFile(File(imagePath))
        .whenComplete(() async {
      imageURL = await snapshot.child(imageName + "/image").getDownloadURL();
    });
    return imageURL;
  }
}
