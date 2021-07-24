import 'package:aview2/components/items/radio_button.dart';
import 'package:aview2/components/items/reviews_profile_item.dart';
import 'package:aview2/helper/helper_style.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String dropdownValue = '2006';
  String genderGroupValue = 'Female';
  TextEditingController nameTEC = TextEditingController(text: '');
  TextEditingController emailTEC = TextEditingController(text: '');
  TextEditingController bioTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var responsive = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        shadowColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () async {
              Navigator.pushNamed(context, EditProfileScreenRoute);
              // await Provider.of<ReviewerProvider>(context, listen: false)
              //     .retrieveUserData('0bsCX1kRU26pNJDQKub9');
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                'assets/images/image_icon_edit_4_pic_512x512.png',
                scale: 25,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            color: Colors.transparent,
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
                            'Radwa ElHassany',
                            style: textTheme.headline5,
                          ),
                          Text(
                            'RadwaHassany@gmail.com',
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
                                  Text('3', style: textTheme.headline6),
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
                                  Text('Traveller', style: textTheme.headline6),
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
                              image: AssetImage('assets/images/woman.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 20,
                  offset: Offset(1, 5), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Text('Reviews: ', style: textTheme.bodyText1),
          SizedBox(
            height: responsive.height * .16,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return ReviewsItem(
                  rate: 2.5,
                  reviewDescription: 'Best burger in Egypt.',
                  reviewPlace: 'Buffalo Burger',
                );
              },
            ),
          ),
          SizedBox(height: 14),
          SizedBox(
            height: responsive.height * .17,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            index == 0
                                ? 'assets/images/woman_reviewer.jpeg'
                                : 'assets/images/man_reviewer.jpeg',
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          index == 0 ? 'Radwa ElHassany' : 'Ahmed Nasser',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Text('Lists: ', style: textTheme.bodyText1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Fav Places',
                  style: Theme.of(context).textTheme.headline3,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Show All List >>>',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          Text('Lists: ', style: textTheme.bodyText1),
          Text('Optional Info:', style: textTheme.headline1),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Year of birth ', style: textTheme.bodyText1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: kCustomContainerDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    underline: SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down,
                        color: Colors.deepPurple),
                    iconSize: responsive.width * .08,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: [
                      '2006',
                      '2005',
                      '2004',
                      '2003',
                      '2002',
                      '2001',
                      '2000',
                      '1999',
                      '1998',
                      '1997',
                      '1996',
                      '1995',
                      '1994',
                      '1993',
                      '1992',
                      '1991',
                      '1990',
                      '1989',
                      '1988',
                      '1987',
                      '1986'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: textTheme.headline3),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phone Number', style: textTheme.bodyText1),
              Container(
                padding: EdgeInsets.all(8),
                decoration: kCustomContainerDecoration,
                child: Text('+02 01129264839', style: textTheme.headline3),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gender', style: textTheme.bodyText1),
              LabeledRadio(
                value: 'Male',
                label: 'Male',
                groupValue: genderGroupValue,
                onChanged: (newValue) {
                  setState(() {
                    genderGroupValue = newValue;
                  });
                },
              ),
              LabeledRadio(
                value: 'Female',
                label: 'Female',
                groupValue: genderGroupValue,
                onChanged: (newValue) {
                  setState(() {
                    genderGroupValue = newValue;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
