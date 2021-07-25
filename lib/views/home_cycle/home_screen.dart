import 'package:aview2/components/widgets/login_and_signup_header.dart';
import 'package:aview2/services/firebase_auth_service.dart';
import 'package:aview2/utils/routing_constants.dart';
import 'package:aview2/view_models/providers/home_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aview2/components/items/home_item.dart';
import 'package:aview2/models/home_model.dart';
import 'package:share/share.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey(); // Create a key
  // createAlertDialog(BuildContext context) {
  //   return showDialog(context: context, builder: context{
  //    AlertDialog(
  //    title: Text("Hi"),
  //   content: ,
  //    );
  //   });
  //}

  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    String msg = 'hello iam ahmed';
    return Scaffold(
      key: drawerKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MapsScreenRoute),
        child: Icon(Icons.map),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ProfileScreenRoute),
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Image.asset('assets/images/unnamed.png'),
            ),
          ),
        ],
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
                  style: textTheme.subtitle1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, HelpScreenRoute),
                leading: Icon(
                  Icons.help_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'Help',
                  style: textTheme.subtitle1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => share(context, msg),
                leading: Icon(
                  Icons.share,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: GestureDetector(
                  onTap: () {
                    share(context, msg);
                    print("Shared pressed");
                  },
                  child: Text(
                    'Share',
                    style: textTheme.subtitle1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, AboutUsScreenRoute),
                leading: Icon(
                  Icons.assignment_late_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'About Us',
                  style: textTheme.subtitle1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, FqaScreenRoute),
                leading: Icon(
                  Icons.question_answer_outlined,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'FAQ',
                  style: textTheme.subtitle1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: ListTile(
                onTap: () {
                  //context.read()<FirebaseAuthService>().signOut();
                  Navigator.pushNamed(context, LoginScreenRoute);
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.deepOrange,
                  size: 30,
                ),
                title: Text(
                  'Log Out',
                  style: textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
          semanticChildCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 2,
            crossAxisCount: 2,
          ),
          itemCount: homeModelList.length,
          itemBuilder: (BuildContext ctx, index) {
            return HomeItem(
              onTap: () {
                // TODO: lama b3ml set ll data with provider thrown exception check it
                Provider.of<HomeProvider>(context, listen: false)
                    .setTitle(homeModelList[index].title);
                Navigator.pushNamed(context, CategoryScreenRoute);
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

void share(BuildContext context, String msg) {
  final box = context.findRenderObject() as RenderBox?;
  Share.share(
    msg,
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}
