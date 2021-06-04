import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool haveArrowButton;

  const CustomAppBar({Key? key, required this.haveArrowButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height / 10,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.deepOrange, Color(0xffffb389)]),
        ),
        child: Row(
          children: <Widget>[
            haveArrowButton
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      print("pop");
                      Navigator.of(context).pop();
                    })
                : Container()
          ],
        ),
      ),
    );
  }
}
