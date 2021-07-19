import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Container(
          child: Text(
        "Chat Screen",
        style: textTheme.headline1,
      )),
    );
  }
}
