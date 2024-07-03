import 'dart:async';

import 'package:bmi_app/activities/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  @override
  _Splash createState()=>_Splash();
}

class _Splash extends State<Splash>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>MyHomePage()),
      );
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child:Center(
          child: Container(
            width: 200,
            child:RichText(
              text:const TextSpan(
                children: [
                  TextSpan(
                      text: 'BMI',
                      style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextSpan(
                      text: " Calculator",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      )
                  )
                ],
              )
            )
          )
        )
      )
    );
  }
}