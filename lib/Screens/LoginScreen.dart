import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/asset/internshipprojectbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ), //for image

          Positioned(
            //top: 170,
            child: GestureDetector(
              onTap: () {print('tapped');},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  border: Border.all(color: Colors.white30,width: 2),
                ),
                height: 100,
                width: 400,
                child: Center(
                    child: Text(
                  "CREATE AN ACCOUNT",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
              ),
            ),
          ),

          Positioned(
            top: 400,
            child: GestureDetector(
              onTap: () {print('tapped');},
              child: Container(
                decoration: BoxDecoration(

                  color: Colors.grey.withOpacity(0.5),
                  border: Border.all(color: Colors.white30,width: 2),
                ),
                height: 100,
                width: 400,

                child: Center(
                    child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              height: 100,
              width: 400,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SIGN IN WITH ",style: TextStyle(color: Colors.white),),
                  GestureDetector(
                    onTap: (){print('tapped');},
                      child: Text(
                    "Google",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
