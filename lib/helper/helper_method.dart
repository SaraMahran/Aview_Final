import 'package:flutter/material.dart';

void kShowSnackBar(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1300),
      backgroundColor: Colors.deepOrange,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            message,
            maxLines: 1,
            style: TextStyle(fontFamily: 'alfa'),
          )),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: kWidth(context) * .04,
            child: Icon(Icons.check, color: Colors.green),
          )
        ],
      ),
    ),
  );
}

/// hide widget when open soft keyboard
bool kKeyboardIsHidden(BuildContext context) {
  bool showProceedBtn = MediaQuery.of(context).viewInsets.bottom == 0.0;
  return showProceedBtn;
}

/// get width  of screen
double kWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

/// get height of screen
double kHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
