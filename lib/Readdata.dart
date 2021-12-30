import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_project/Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
class readdata extends StatelessWidget {
  // const readdata({Key? key}) : super(key: key);
final Stream <QuerySnapshot>firedata = FirebaseFirestore.instance.collection("Student").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

        stream: firedata,//database.readata(),
         builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) //( context,  AsyncSnapshot<dynamic> snapshot)
         {
          if(snapshot.hasError){
           return Text('error');
          }
            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text("${data['lordwham']}"),
                   // subtitle: Text(data['company']),
                  );
                }).toList());

           // return ListView.separated(
           //   separatorBuilder: (context,index) => SizedBox(height: 10,),
           //   itemCount: snapshot.data!.docs.length,
           //
           //     itemBuilder: (context,index){
           //       Map<String,dynamic> Studentinfo = snapshot.data!.docs[index].data()! as Map<String,dynamic>;
           //       String docID = snapshot.data!.docs[index].id;
           //       String  Name = Studentinfo['NAME'] ;
           //       String DOB = Studentinfo['DOB'] ;
           //       String Gender = Studentinfo['GENDER']  ;
           //       return Ink(
           //         child: ListTile(
           //           onTap: (){},
           //           title: Text(Name,style: TextStyle(fontSize: 40),),
           //           subtitle: Text(DOB),
           //         ),
           //
           //       );
           //
           //       // return ListTile(
           //       //   title: Text("NAME:" Name,style: TextStyle(fontSize: 20),),
           //       // );// Container( child: Text(''),);
           //     },
           //
           //
           // );


        },

    );
  }
}
