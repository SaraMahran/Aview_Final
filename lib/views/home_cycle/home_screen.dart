import 'package:aview2/components/widgets/login_and_signup_header.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aview2/components/items/home_item.dart';
import 'package:aview2/models/home_model.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey(); // Create a key

  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.orange[800],
          ),
        ),
        leadingWidth: 70,
        leading: FlatButton(
          child: Image.asset(
            'assets/images/menu_icon.png',
            width: 100,
            height: 100,
          ),
          onPressed: () => drawerKey.currentState!.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            LoginAndSignUpHeader(),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, SettingsScreenRoute),
                leading: Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => print('Help tapped'),
                leading: Icon(
                  Icons.help_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => print('Share tapped'),
                leading: Icon(
                  Icons.share,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'Share',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => print('About Us tapped'),
                leading: Icon(
                  Icons.assignment_late_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => print('FQA tapped'),
                leading: Icon(
                  Icons.question_answer_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'FQA',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: ListTile(
                onTap: () => print('Log Out tapped'),
                leading: Icon(
                  Icons.logout,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple[700]),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: homeModelList.length,
          itemBuilder: (BuildContext ctx, index) {
            return HomeItem(
              onTap: () {
                // TODO: lama b3ml set ll data with provider thrown exception check it
                Provider.of<HomeProvider>(context, listen: false)
                    .setTitle(homeModelList[index].title);
                print(
                    Provider.of<HomeProvider>(context, listen: false).getTitle);
              },
              title: homeModelList[index].title,
              imagePath: homeModelList[index].imagePath,
            );
          }),
    );
  }
}
