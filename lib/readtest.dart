import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
final  variable = FirebaseFirestore.instance;
final CollectionReference maincol = variable.collection("StudentInfo");

//  ReadData()async{
//
//   var coldata = maincol.doc().snapshots();
//   print(coldata.map);
//
// }

class UserInformation extends StatefulWidget {
 @override
 _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
 final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('StudentInfo').snapshots();

 @override
 Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
   stream: _usersStream,
   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
     return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
     return Text("Loading");
    }

    return ListView(
     children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return ListTile(
       title: Text(data['Name']??"Defualt data"),
       subtitle: Text(data['Date Of Birth']??"Default Data"),
      );
     }).toList(),
    );
   },
  );
 }
}
