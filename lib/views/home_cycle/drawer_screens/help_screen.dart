import 'package:aview2/components/items/radio_button.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/views/home_cycle/drawer_screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Request Help',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage(
            //       'assets/images/From_Right_Transperant.png',
            //     ),
            //     fit: BoxFit.cover),
            ),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset('assets/images/call-center.png', scale: 5),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Center(
                child: Text(
                  'How can we help you?',
                  style: textTheme.headline2,
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 143),

                    //padding: const EdgeInsets.fromLTRB(20, 20, 120, 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.pushNamed(context, ChatScreenRoute);
                            },
                            child: Image.asset(
                              'assets/images/chat.png',
                              scale: 4,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          'Chat with us',
                          style: textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.pushNamed(context, EmailScreenRoute);
                            },
                            child: Image.asset(
                              'assets/images/email.png',
                              scale: 7,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          'Email us',
                          style: textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
