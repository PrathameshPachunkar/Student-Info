import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('StudentInfo');

class database {
  static String? userid;
  static Future<void> Adddata({
    required String NAME,
    required String DOB,
    required String GENDER,
  }) async {
    DocumentReference documentRefrencer =
        _mainCollection.doc().collection('Students').doc();
    final data = {
      "NAME": NAME,
      "DOB": DOB,
      "GENDER": GENDER,
    };
    await documentRefrencer
        .set(data)
        .whenComplete(() => print('database updated'))
        .catchError((e) => print('ERROR'));
  }

  static Stream<QuerySnapshot> readata() {
    CollectionReference StudentInfo =
        _mainCollection.doc(userid).collection("Students");

    return StudentInfo.snapshots();
  }
}
