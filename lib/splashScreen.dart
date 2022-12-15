import 'dart:async';
import 'dart:convert';

import 'dart:io';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi/main.dart';
import 'package:path/path.dart';

import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'mainDashboard.dart';


bool maindashboardLaunched = false;

class splashScreeen extends StatefulWidget {
  const splashScreeen({ Key? key}) : super(key: key);

  @override
  State<splashScreeen> createState() => _splashScreeenState();
}

class _splashScreeenState extends State<splashScreeen> {
  @override
  Widget build(BuildContext context) {
    if(maindashboardLaunched!=true){
      maindashboardLaunched=true;
      Timer(
          Duration(seconds: 5),
              () => {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (mainDashboard())) )
          });
    }

    //Print()
    return Scaffold(
      body:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50.sp,
                  height: 50.sp,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1.sp,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
