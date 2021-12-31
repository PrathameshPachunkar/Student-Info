import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:internship_project/Screens/infoenter.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
 TextEditingController controller = TextEditingController();
final _auth = FirebaseAuth.instance;
late String email;
late String password;
late double i;
late DateTime presentdate = DateTime.now();
String dropvalue = "Male";



class _RegisterScreenState extends State<RegisterScreen> {
@override
void contsize(){
  for(i=20;1<= MediaQuery.of(context).size.height;i++);
}

selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: presentdate, // Refer step 1
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != presentdate)
    setState(
          () {
        presentdate = picked;
      },
    );
}
@override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f0f0f),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),

            ),
          ),

          Positioned(

            top: 140,
              child: Container(
                // margin: EdgeInsets.only(right: 30,left: 30),
                height: 50,
                width: MediaQuery.of(context).size.width/1.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black54
                    ),
                  ],
                ),
                child: TextField(

                  //controller:controller ,
                  onChanged: (value){
                    email = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "NAME",
                    fillColor: Colors.red,
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(20),

                    ),

                  ),
                ),
              ),

          ),
          
          Positioned(
            top: 200,
            child: Container(
            width: MediaQuery.of(context).size.width/1.05,
            height: 50,
            child: Center(
              child: DropdownButton(
                  value: dropvalue,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropvalue = newvalue!;
                    }
                    );
                  }
                  ),
            ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black54
                  )
                ],
              ),
            
          ),
          ),

          Positioned(
            top: 260,
            child: Container(
              width: MediaQuery.of(context).size.width/1.05,
              height: 50,
              child: Center(
                child: Text("${presentdate.toLocal()}".split(' ')[0],)
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black54
                  )
                ],
              ),

            ),
          ),

        ],
      )

    );

  }
}
