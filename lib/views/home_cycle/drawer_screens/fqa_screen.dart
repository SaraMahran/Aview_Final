import 'package:aview2/utils/routing_constants.dart';
import 'package:expandable/expandable.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FqaScreen extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();

  //final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        //automaticallyImplyLeading: false,
        title: Text(
          'FQA',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/faq.png", scale: 6),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: ExpansionTileCard(
                    baseColor: Colors.deepOrange[50],
                    expandedColor: Colors.deepOrange[50],
                    key: cardA,
                    leading: CircleAvatar(
                        child: Image.asset("assets/images/list.png")),
                    title: Text(
                      "How to make a list of places?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "You can create a list of places from your profile account. Go to profile, lists, and press on the + icon which will lead you to create a new screen.",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.deepPurple,
                                      fontFamily: 'Crimson',
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            onPressed: () {
                              cardA.currentState?.collapse();
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.arrow_upward),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Close'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: ExpansionTileCard(
                    baseColor: Colors.deepOrange[50],
                    expandedColor: Colors.deepOrange[50],
                    key: cardC,
                    leading: CircleAvatar(
                        child: Image.asset("assets/images/review.png")),
                    title: Text(
                      "How to review a place?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "You can review a place by going to the home page, choose the category that this place belongs to, and select the place you want to review. Once you are navigated to the places's screen, you will find a button that says 'Add a review'.",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.deepPurple,
                                      fontFamily: 'Crimson',
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            onPressed: () {
                              cardC.currentState?.collapse();
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.arrow_upward),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Close'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: ExpansionTileCard(
                    baseColor: Colors.deepOrange[50],
                    expandedColor: Colors.deepOrange[50],
                    key: cardB,
                    leading: CircleAvatar(
                        child: Image.asset("assets/images/secure.png")),
                    title: Text(
                      "How to change my password?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    children: <Widget>[
                      Divider(thickness: 1.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "You can change your password by going to your profile, clicking on the edit icon to be directed to edit your profile. From there you can click on change my password in the bottom of the screen.",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.deepPurple,
                                      fontFamily: 'Crimson',
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            onPressed: () {
                              cardC.currentState?.collapse();
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.arrow_upward),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Close'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
