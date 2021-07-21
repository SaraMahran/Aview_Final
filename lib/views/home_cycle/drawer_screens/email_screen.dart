import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
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
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/From_Right_Transperant.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Image.asset(
                'assets/images/contact.png',
                scale: 5,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Contact us on this email:',
                  style: textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Aview2021@gmail.com',
                style: textTheme.headline2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Thank you for contacting us!',
                style: textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
