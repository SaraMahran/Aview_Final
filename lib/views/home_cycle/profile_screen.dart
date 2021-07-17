import 'package:aview2/components/cutom_shadow.dart';
import 'package:aview2/components/items/radio_button.dart';
import 'package:aview2/components/items/reviews_profile_item.dart';
import 'package:aview2/components/widgets/buttons/custom_rounded_border_button.dart';
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
        shadowColor: Colors.transparent,
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, EditProfileScreenRoute),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                  'assets/images/image_icon_edit_4_pic_512x512.png'),
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
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Radwa ElHassany',
                            style: textTheme.headline2,
                          ),
                          Text(
                            'RadwaHassany@gmail.com',
                            style: textTheme.headline3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Radwa ElHassany',
                                  style: textTheme.headline4),
                              Container(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                              Text('Radwa ElHassany',
                                  style: textTheme.headline4),
                              Container(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                              Text('Radwa ElHassany',
                                  style: textTheme.headline4),
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
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Text('Name: ', style: textTheme.headline1),
            Text(
              'Radwa ElHassany',
              style: textTheme.headline2,
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          /*Container(
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
            ),*/
          Row(children: [
            Text(
              'Email: ',
              style: textTheme.headline1,
            ),
            Text(
              'RadwaHassany@gmail.com',
              style: textTheme.headline2,
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Badges', style: textTheme.headline1),
              SizedBox(width: responsive.width * .3),
              Container(
                margin: EdgeInsets.only(left: 35),
                child: Image.asset(
                  'assets/images/medal.png',
                  height: 70,
                  width: 70,
                  //scale: 7,
                ),
              )
            ],
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Number of reviews', style: textTheme.headline1),
              SizedBox(width: responsive.width * .15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: kCustomContainerDecoration,
                child: Text('2', style: textTheme.headline2),
              ),
            ],
          ),
          /* ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              print('Hi');
            },
            child: Text('ElevatedButton'),
          ),*/
          SizedBox(height: 14),
          Text('Reviews: ', style: textTheme.headline1),
          SizedBox(
            height: responsive.height * .16,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return ReviewsItem(
                  rate: 2.5,
                  reviewDescription: 'best burger in egypt',
                  reviewPlace: 'Buffalo Burger',
                );
              },
            ),
          ),
          SizedBox(height: 14),
          Text('Lists: ', style: textTheme.headline1),
          SizedBox(
            height: responsive.height * .08,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CustomShadow(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name: Radwa ElHassany'),
                    ),
                  );
                }),
          ),
          SizedBox(height: 20),
          Text('Optional Info:', style: textTheme.headline1),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Year of birth ', style: textTheme.headline1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: kCustomContainerDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    underline: SizedBox(),
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
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
                        child: Text(value, style: textTheme.headline6),
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
              Text('Phone Number', style: textTheme.headline1),
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
              Text('Gender', style: textTheme.headline1),
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
