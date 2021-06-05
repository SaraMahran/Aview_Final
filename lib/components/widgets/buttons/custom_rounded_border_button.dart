import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRoundedBorderButton extends StatelessWidget {
  late String titleBtn;
  late VoidCallback onTap;

  CustomRoundedBorderButton({required this.onTap, required this.titleBtn});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.orange, width: 2),
      ),
      onPressed: onTap,
      child: Text(
        titleBtn,
        style: Theme.of(context).textTheme.headline1,
      ),
      color: Colors.orange[100],
    );
  }
}
