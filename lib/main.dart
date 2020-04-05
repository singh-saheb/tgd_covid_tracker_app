import 'package:flutter/material.dart';
import 'package:tgd_covid_tracker/datasorce.dart';
import 'package:tgd_covid_tracker/homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
fontFamily: 'Circular',
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}