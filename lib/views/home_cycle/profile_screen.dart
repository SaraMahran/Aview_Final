import 'package:aview2/components/cutom_shadow.dart';
import 'package:aview2/components/items/radio_button.dart';
import 'package:aview2/components/items/reviews_profile_item.dart';
import 'package:aview2/components/widgets/buttons/custom_rounded_border_button.dart';
import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String dropdownValue = '2021';
  String genderGroupValue = 'Male';
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.settings,color: Colors.orange),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: responsive.height * .2,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/test/chicken_fila_logo.jpeg'),
                    fit: BoxFit.fill),
              ),
            ),
            CustomShadow(
              child: TextField(
                controller: nameTEC,
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Name'),
              ),
            ),
            CustomShadow(
              child: TextField(
                controller: emailTEC,
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Email'),
              ),
            ),
            CustomShadow(
              child: TextField(
                controller: bioTEC,
                maxLines: 5,
                decoration: kRoundedDecorationTF.copyWith(hintText: 'Bio...'),
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Badges', style: textTheme.headline1),
                SizedBox(width: responsive.width * .3),
                Image.asset('assets/images/facebook_logo.png')
              ],
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Review Number', style: textTheme.headline1),
                SizedBox(width: responsive.width * .15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: kCustomContainerDecoration,
                  child: Text('2', style: textTheme.headline1),
                ),
              ],
            ),
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
            Center(child: Text('No Lists to show')),
            SizedBox(height: 20),
            Text('Optional Info:', style: textTheme.headline1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Year of birth ', style: textTheme.headline3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: kCustomContainerDecoration,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      underline: SizedBox(),
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      iconSize: responsive.width * .08,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: [
                        '2021',
                        '2020',
                        '2019',
                        '2018',
                        '2017',
                        '2016',
                        '2015',
                        '2014',
                        '2013',
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
                Text('Phone Number', style: textTheme.headline3),
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
                Text('Country', style: textTheme.headline3),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: CustomRoundedBorderButton(
                onTap: () => print('Changes Saved'),
                titleBtn: 'Save Profile Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


