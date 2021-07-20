import 'package:aview2/components/cutom_shadow.dart';
import 'package:aview2/components/items/radio_button.dart';
import 'package:aview2/components/items/reviews_profile_item.dart';
import 'package:aview2/components/widgets/buttons/custom_rounded_border_button.dart';
import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: responsive.height * .2,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/woman.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: responsive.width * .55,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Icon(Icons.add_a_photo,
                        color: Colors.purple[900], size: 35),
                  ),
                ),
              ],
            ),
            CustomShadow(
              child: TextField(
                controller: nameTEC,
                decoration: kRoundedDecorationTF.copyWith(
                  hintText: 'Name',
                ),
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
            Text('Lists: ', style: textTheme.headline1),
            Center(child: Text('No Lists to show')),
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
                      icon:
                          Icon(Icons.keyboard_arrow_down, color: Colors.black),
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
                  child: Text('+02 01129264839', style: textTheme.headline1),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: CustomRoundedBorderButton(
                onTap: () => print('Changes Saved'),
                titleBtn: 'Save Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
