import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteReviewer extends StatelessWidget {
  final int index;

  FavoriteReviewer({required this.index});

  @override
  Widget build(BuildContext context) {
    var responsive = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: index == 0 ? Text('Radwa') : Text('Ahmed'),
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: responsive.height * .3,
                        width: responsive.width,
                        padding: EdgeInsets.only(top: 40),
                        margin: EdgeInsets.only(top: 40),
                        decoration: kCustomContainerDecoration.copyWith(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.1,
                              0.9,
                              //0.1
                            ],
                            colors: [
                              Colors.deepPurple,
                              Colors.deepOrange,
                              //Colors.white,
                            ],
                          ),
                        ),

                        // border: Border.all(color: Colors.white),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              index == 0 ? 'Radwa ElHassany' : 'Ahmed Nasser',
                              style: textTheme.headline5,
                            ),
                            Text(
                              index == 0
                                  ? 'Radwa@gmail.com'
                                  : 'ahmed@yahoo.com',
                              style: textTheme.headline5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 35),
                                  child: Image.asset(
                                    'assets/images/medal.png',
                                    height: 70,
                                    width: 50,
                                    scale: 10,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  child: VerticalDivider(
                                    color: Colors.deepOrange,
                                    thickness: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('Number of reviews :',
                                        style: textTheme.headline6),
                                    Text(index == 0 ? '7' : '13',
                                        style: textTheme.headline6),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  child: VerticalDivider(
                                    color: Colors.deepPurple,
                                    thickness: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('Bio:', style: textTheme.headline6),
                                    Text(index == 0 ? 'Player' : 'Traveller',
                                        style: textTheme.headline6),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: responsive.height * .12,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  index == 0
                                      ? 'assets/images/woman_reviewer.jpeg'
                                      : 'assets/images/man_reviewer.jpeg',
                                ),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  index == 0 ? 'Gender: Female' : 'Gender: Male',
                  style: textTheme.headline2,
                ),
                Text(
                  index == 0 ? 'BirthDate: 1/10/1990' : 'BirthDate: 12/8/1996',
                  style: textTheme.headline2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  index == 0 ? 'No. 01293473459' : 'No. 0111172349',
                  style: textTheme.headline2,
                ),
                Text(
                  index == 0 ? 'Review No. 7' : 'Review No. 13',
                  style: textTheme.headline2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
