import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/facebook_logo.png'),
                ),
              ),
            ),
            TextFieldShadow(
              child: TextField(
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Name'),
              ),
            ),
            TextFieldShadow(
              child: TextField(
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Email'),
              ),
            ),
            TextFieldShadow(
              child: TextField(
                maxLines: 5,
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Bio...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldShadow extends StatelessWidget {
  final Widget child;

  const TextFieldShadow({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
