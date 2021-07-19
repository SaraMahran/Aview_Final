import 'package:aview2/components/items/radio_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Consumer<SettingProvider>(
      builder: (ctx, value, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.deepOrange, //change your color here
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            shadowColor: Colors.transparent,
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/From_Left.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CenterSettingTitle(title: 'Preferences'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Language',
                  style: textTheme.headline2,
                ),
                Row(
                  children: [
                    LabeledRadio(
                      value: 'English',
                      label: 'English',
                      groupValue: value.getLanguageGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLanguage(newValue);
                      },
                    ),
                    LabeledRadio(
                      value: 'Arabic',
                      label: 'Arabic',
                      groupValue: value.getLanguageGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLanguage(newValue);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Notification',
                  style: textTheme.headline2,
                ),
                Row(
                  children: [
                    LabeledRadio(
                      value: 'On',
                      label: 'On',
                      groupValue: value.notificationGroupValue,
                      onChanged: (newValue) {
                        value.changeStateNotification(newValue);
                      },
                    ),
                    LabeledRadio(
                      value: 'Off',
                      label: 'Off',
                      groupValue: value.notificationGroupValue,
                      onChanged: (newValue) {
                        value.changeStateNotification(newValue);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CenterSettingTitle(title: 'Privacy'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Location',
                  style: textTheme.headline2,
                ),

                Row(
                  children: [
                    LabeledRadio(
                      value: 'Save',
                      label: 'Save',
                      groupValue: value.locationGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLocation(newValue);
                      },
                    ),
                    LabeledRadio(
                      value: 'UnSave',
                      label: 'Don\'t Save',
                      groupValue: value.locationGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLocation(newValue);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Lists',
                  style: textTheme.headline2,
                ),
                Row(
                  children: [
                    LabeledRadio(
                      value: 'Public',
                      label: 'Public',
                      groupValue: value.listsGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLists(newValue);
                      },
                    ),
                    LabeledRadio(
                      value: 'Private',
                      label: 'Private',
                      groupValue: value.listsGroupValue,
                      onChanged: (newValue) {
                        value.changeStateLists(newValue);
                      },
                    ),
                  ],
                ),
                //CenterSettingTitle(title: 'Account'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CenterSettingTitle extends StatelessWidget {
  String title;
  CenterSettingTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingProvider with ChangeNotifier {
  String languageGroupValue = 'English';
  String notificationGroupValue = 'On';
  String locationGroupValue = 'Save';
  String listsGroupValue = 'Public';

  String get getNotificationGroupValue => notificationGroupValue;
  String get getLanguageGroupValue => languageGroupValue;
  String get getLocationGroupValue => locationGroupValue;
  String get getListsGroupValue => listsGroupValue;

  void changeStateLanguage(String value) {
    languageGroupValue = value;
    notifyListeners();
  }

  void changeStateLists(String value) {
    listsGroupValue = value;
    notifyListeners();
  }

  void changeStateLocation(String value) {
    locationGroupValue = value;
    notifyListeners();
  }

  void changeStateNotification(String value) {
    notificationGroupValue = value;
    notifyListeners();
  }
}
