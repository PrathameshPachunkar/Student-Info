import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_project/Database.dart';
import 'package:internship_project/Readdata.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:internship_project/firebase.dart';
import 'package:internship_project/readtest.dart';

class InfoEnter extends StatefulWidget {
  const InfoEnter({Key? key}) : super(key: key);

  @override
  _InfoEnterState createState() => _InfoEnterState();
}

class _InfoEnterState extends State<InfoEnter> with TickerProviderStateMixin {
  late TabController _controller;
  DateTime presentdate = DateTime.now();
  TextEditingController name = TextEditingController();
  String dropvalue = "Male";

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    Firebase.initializeApp();
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              print('tapped');
            },
            child: Row(
              children: [
                Icon(
                  Icons.input,
                  size: 30,
                ),
                Text(
                  'SIGN-OUT',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.edit),
              text: "Enter info",
            ),
            Tab(
              icon: Icon(Icons.account_circle),
              text: 'STUDENTS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                  hintText: "NAME",
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "${presentdate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 20),
                    )),
                    IconButton(
                      onPressed: () {
                        selectDate(context);
                      },
                      icon: Icon(Icons.calendar_today_sharp),
                    ),
                  ],
                ),
              ),
              DropdownButton(
                  value: dropvalue,
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
                    });
                  }),
              FloatingActionButton(onPressed: () {
                setState(() {


                  Firebasedata.adddata(

                      date: presentdate.toString(),
                      name: name.text,
                      gender: dropvalue);
                });//set state for adding data to firebase
              }),
            ],
          ),
          Container(
            child: UserInformation(),
          ),
        ],
      ),
    );
  }
}

// {
//
// "NAME":name.text,
// "DATE": presentdate.toString(),
// "Gender":dropvalue,
// },
// FirebaseFirestore.instance.collection("USER1").add(
//
//     );