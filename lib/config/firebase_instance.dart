import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseInstance {
  static var firebaseAuth;
  static var firebaseStorage;
  static var firestore;
  static var authController;
  FirebaseInstance() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseStorage = FirebaseStorage.instance;
    firestore = FirebaseFirestore.instance;
    authController = FirebaseAuth.instance;
  }
}
