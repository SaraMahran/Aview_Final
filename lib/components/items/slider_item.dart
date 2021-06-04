import 'package:flutter/material.dart';

class SliderItem extends StatefulWidget {
  final String? title;
  final String? description;
  final String? image;

  SliderItem({this.title, this.description, this.image});

  @override
  SliderItemState createState() => SliderItemState();
}

class SliderItemState extends State<SliderItem> with TickerProviderStateMixin {
  late AnimationController _controllerOfTitle;
  late Animation<Offset> _offsetAnimationOfTitle;
  late AnimationController _controllerOfImage;
  late Animation<Offset> _offsetAnimationOfImage;
  late AnimationController _controllerOfDescription;
  late Animation<Offset> _offsetAnimationOfDescription;

  @override
  void initState() {
    super.initState();
    _controllerOfTitle = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _offsetAnimationOfTitle = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllerOfTitle,
      curve: Curves.ease,
    ));
    _controllerOfTitle.forward();

    _controllerOfDescription = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _offsetAnimationOfDescription = Tween<Offset>(
      begin: Offset(-.25, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllerOfDescription,
      curve: Curves.ease,
    ));
    _controllerOfDescription.forward();

    _controllerOfImage = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _offsetAnimationOfImage = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllerOfImage,
      curve: Curves.ease,
    ));
    _controllerOfImage.forward();
  }

  @override
  void dispose() {
    _controllerOfTitle.dispose();
    _controllerOfImage.dispose();
    _controllerOfDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: _offsetAnimationOfImage,
          child: Center(
            child: Image.asset(
              widget.image ?? '',
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width * 1,
              fit: BoxFit.contain,
              scale: 2.0,
            ),
          ),
        ),
        SlideTransition(
          position: _offsetAnimationOfTitle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              widget.title ?? '',
              style: TextStyle(
                  fontFamily: 'Lobster',
                  color: Colors.deepOrange,
                  fontSize: 40),
            ),
          ),
        ),
        SlideTransition(
          position: _offsetAnimationOfDescription,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 30),
            child: Text(
              widget.description ?? '',
              style: TextStyle(
                  fontFamily: 'Crimson',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.purple[400]),
            ),
          ),
        ),
      ],
    );
  }
}
