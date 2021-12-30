

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
CollectionReference collection = firestore.collection("StudentInfo");

class Firebasedata {
  static Future<void> adddata(
      {required String name,
      required String date,
      required String gender}) async {
    final fdata = await firestore.collection("StudentInfo").doc("$name").set({
      "Name": name,
      "Date Of Birth": date,
      "Gender": gender,
    });
  }




}
