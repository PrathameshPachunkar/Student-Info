import 'package:flutter/material.dart';


// class studentInfoScreen extends StatefulWidget {
//
//
//   @override
//   _StudentInfoScreenState createState() => _StudentInfoScreenState();
//
// }
//
// class _StudentInfoScreenState extends State<StudentInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class StudentInfoScreen extends StatelessWidget {

  late String name;
  late String dob;
  late String gender;
  StudentInfoScreen({required  this.name,required  this.dob, required  this.gender});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(name),
          Text(dob),
          Text(gender),
          // Container(
          //   width: 10,
          //   height: 10,
          //   decoration: BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.circular(30)
          //   ),
          //
          // ),

          // Column(
          //   children: [
          //
          //     Row(
          //       children: [
          //         Text(name),
          //         IconButton(onPressed: (){}, icon: Icon(Icons.create_sharp)),
          //
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Text(dob,overflow: TextOverflow.fade ,),
          //         IconButton(onPressed: (){}, icon: Icon(Icons.create_sharp))
          //
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Text(gender),
          //         IconButton(onPressed: (){}, icon: Icon(Icons.create_sharp))
          //
          //       ],
          //     ),
          //
          //   ],
          // )
        ],
      ),


    );
  }
}

