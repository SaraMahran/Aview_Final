import 'package:aview2/components/documentation_image_picker_widget.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPlaceOwnerScreen extends StatelessWidget {
  final TextEditingController licenceNumberTEC =
          TextEditingController(text: ''),
      nationalIdPhotoTEC = TextEditingController(text: ''),
      placePhotoController = TextEditingController(text: ''),
      fullName = TextEditingController(text: ''),
      email = TextEditingController(text: ''),
      password = TextEditingController(text: '');
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Place Owner Sign Up',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Place Owner Info',
                style: theme.textTheme.headline2!.copyWith(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Form(
                  key: globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          textEditingController: fullName,
                          icon: FontAwesomeIcons.userAlt,
                          hint: "Full Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full name is required";
                            }
                          },
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: FontAwesomeIcons.userAlt,
                          hint: "Email",
                          textEditingController: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                          },
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: FontAwesomeIcons.userLock,
                          hint: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                          },
                          textEditingController: password,
                        )),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Place License',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'National Id Photo',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Place Photo',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: LoginButton(
                onTap: () {
                  globalKey.currentState!.validate()
                      ? Fluttertoast.showToast(
                          msg:
                              'Thanks for signing up\n We will send you a verification email after checking your information.')
                      : Fluttertoast.showToast(msg: 'Complete Fields');
                },
                buttonTitle: 'Sign Up',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
