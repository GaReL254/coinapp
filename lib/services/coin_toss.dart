import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

Future<bool> addCoin() async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DateTime now = new DateTime.now();
    int ran = new Random().nextInt(100);
    FirebaseFirestore.instance
        .collection('coins')
        .add({
      'user': uid,
      'time': now,
      'coin': ran,
        })
        .then((value) => print("added"))
        .catchError((error) => print("Failed to add user: $error"));
    return true;
  } catch (e) {
    return false;
  }
}
