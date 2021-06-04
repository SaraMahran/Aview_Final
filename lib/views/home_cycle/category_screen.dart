import 'package:aview2/view_models/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          Provider.of<HomeProvider>(context, listen: false).getTitle,
        ),
      ),
      body: Container(),
    );
  }
}
