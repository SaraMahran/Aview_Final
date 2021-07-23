import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  final Widget child;

  const CustomShadow({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepOrange,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
