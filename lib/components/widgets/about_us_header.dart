import 'package:flutter/material.dart';

import 'custom_shape_login_header.dart';

class AboutUsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _height / 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Color(0xffffb389)],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _height / 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(
                      0.1, 0.1), // 10% of the width, so there are ten blinds.
                  colors: [
                    Color(0xFFD9795D),
                    Color(0xffffb389),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   height: _height / 5.5,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //           spreadRadius: 0.0,
        //           color: Colors.black26,
        //           offset: Offset(1.0, 10.0),
        //           blurRadius: 20.0),
        //     ],
        //     color: Colors.white,
        //     shape: BoxShape.circle,
        //   ),
        // ),
      ],
    );
  }
}
