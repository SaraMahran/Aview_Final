import 'package:aview2/ui/widgets/login_and_signup_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aview2/components/items/home_item.dart';
import 'package:aview2/models/home_model.dart';

import 'routing_constants.dart';

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
            color: Colors.deepOrange,
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
            ListTile(
              onTap: () => print('setting tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => print('Help tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'Help',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => print('Share tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'Share',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => print('AboutUs tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'AboutUs',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => print('FQA tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'FQA',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => print('LogOut tapped'),
              leading: Image.asset('assets/images/facebook_logo.png'),
              title: Text(
                'LogOut',
                style: TextStyle(fontSize: 20),
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
                Provider.of<HomeProvider>(context)
                    .setTitle(homeModelList[index].title);
                // Navigator.pushNamed(context, HomeDetailsScreenRoute);
                // print(Provider.of<HomeProvider>(context).getTitle);
              },
              title: homeModelList[index].title,
              imagePath: homeModelList[index].imagePath,
            );
          }),
    );
  }
}

class HomeProvider extends ChangeNotifier {
  late final String _title;

  String get getTitle => _title;

  void setTitle(String title) {
    this._title = title;
    notifyListeners();
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Provider.of<HomeProvider>(context).getTitle.toString()',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
