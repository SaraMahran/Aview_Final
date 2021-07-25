import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    TextEditingController reportController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Report To Us',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/From_Right_Transperant.png',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(14),
                child: CustomTextField(
                  hint: "Write your report",
                  keyboardType: TextInputType.text,
                  icon: FontAwesomeIcons.penAlt,
                  textEditingController: reportController,
                  maxLine: 6,
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: LoginButton(
                    onTap: () {
                      if (reportController.text.length == 0) {
                        Fluttertoast.showToast(
                          msg: 'Please write your report',
                          textColor: Colors.black,
                          backgroundColor: Colors.deepOrange,
                          fontSize: 20,
                          gravity: ToastGravity.CENTER_RIGHT,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg:
                              'Thanks for reporting for us.We will get back to you soon on email. ',
                          textColor: Colors.black,
                          backgroundColor: Colors.deepOrange,
                          fontSize: 20,
                          gravity: ToastGravity.CENTER_RIGHT,
                        );
                        Navigator.pop(context);
                      }
                    },
                    buttonTitle: 'Submit Report',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
