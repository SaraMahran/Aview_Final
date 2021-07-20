import 'package:flutter/material.dart';
import 'dart:ui';

//Colors
const kOrangeColor = Colors.deepOrange;
const kOrangeLight = Color(0xffffd5b0);
const kGreenColor = Color(0xFF43A047);
const kGreenLightColor = Color(0xFF66BB6A);

///textFields styles
InputDecoration kRoundedDecorationTF = InputDecoration(
  fillColor: Colors.white,
  hintText: 'Meal Title',
  labelStyle: TextStyle(color: Colors.deepOrange),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

BoxDecoration kCustomContainerDecoration=BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.deepOrange),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black38,
        blurRadius: 5,
        offset: Offset(1, 1),
      ),
    ]);
