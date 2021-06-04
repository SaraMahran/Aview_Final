import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? buttonTitle;
  final VoidCallback onTap;

  LoginButton({Key? key, required this.buttonTitle, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: onTap,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.deepOrange, Color(0xffffb389)],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(buttonTitle!, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
