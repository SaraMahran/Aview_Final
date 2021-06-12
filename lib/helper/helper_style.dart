import 'package:flutter/material.dart';
import 'dart:ui';

//Colors
const kOrangeColor = Colors.deepOrange;
const kOrangeLight = Color(0xffffd5b0);
const kGreenColor = Color(0xFF43A047);
const kGreenLightColor = Color(0xFF66BB6A);

//fonts style
//Brightness kBrightnessIs = SchedulerBinding.instance.window.platformBrightness;

TextStyle kBlackNunitoTS =
    TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'nunito');

TextStyle kWhiteAlfaTS =
    TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'alfa');

TextStyle kRedAlfaTS =
    TextStyle(color: kOrangeColor, fontSize: 18, fontFamily: 'alfa');

TextStyle kRedNunitoTS =
    TextStyle(color: kOrangeColor, fontSize: 20, fontFamily: 'nunito');

///box decorations style
BoxDecoration kWhitRadiusBD = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
);

BoxDecoration kWhiteShadowCardBD = BoxDecoration(
  color:
//  kBrightnessIs == Brightness.dark ? Colors.grey[850] :
      Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
  boxShadow: [
    BoxShadow(color: Colors.grey, blurRadius: 6),
  ],
);

///textFields styles

//otp textField decoration
InputDecoration otpDecorationTF = InputDecoration(
  fillColor: Colors.white,
  contentPadding: EdgeInsets.all(30),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrangeColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrangeColor, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);

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

InputDecoration kUnderlineDecorationTF = InputDecoration(
  hintText: 'Branch Name...',
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kOrangeColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kOrangeColor),
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
