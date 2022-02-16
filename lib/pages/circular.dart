import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/home.dart';
import 'package:flutter_banking_app/utils/styles.dart';

import 'Main-drawer.dart';

class circular extends StatefulWidget {
  const circular({required Key? key}) : super(key: key);

  @override
  State<circular> createState() => _circularState();
}

class _circularState extends State<circular> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Home())));
    return  Scaffold(
        backgroundColor: Styles.primaryColor,


        drawer:MainDrawer(),
         body:
         Center(child: CircularProgressIndicator(color: Styles.accentColor,),),
        appBar: AppBar(title: Text('National transfer'),backgroundColor:Styles.accentColor),
    );

  }
}