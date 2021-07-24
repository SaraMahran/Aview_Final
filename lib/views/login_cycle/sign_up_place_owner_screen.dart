import 'package:aview2/components/documentation_image_picker_widget.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPlaceOwnerScreen extends StatelessWidget {
  final TextEditingController licenceNumberTEC =
          TextEditingController(text: ''),
      nationalIdPhotoTEC = TextEditingController(text: ''),
      placePhotoTEC = TextEditingController(text: ''),
      fullName = TextEditingController(text: ''),
      email = TextEditingController(text: ''),
      password = TextEditingController(text: '');

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: FontAwesomeIcons.userAlt,
                          hint: "Full Name",
                          textEditingController: fullName,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: FontAwesomeIcons.userAlt,
                          hint: "Email",
                          textEditingController: fullName,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: FontAwesomeIcons.userLock,
                          hint: "Password",
                          textEditingController: fullName,
                        )),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: licenceNumberTEC,
                            icon: FontAwesomeIcons.paperclip,
                            hint: 'Place Licence',
                            keyboardType: TextInputType.number,
                            // icon: Icons.email,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: nationalIdPhotoTEC,
                            icon: FontAwesomeIcons.paperclip,
                            hint: 'National Id Photo',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: placePhotoTEC,
                            icon: FontAwesomeIcons.paperclip,
                            hint: 'Place Photo ',
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: Text(
                      //     'Bank Account Details',
                      //     style: theme.textTheme.headline2!.copyWith(
                      //       color: Colors.deepPurple,
                      //     ),
                      //   ),
                      // ),
                      // DocumentationImagePickerWidget(
                      //   textField: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: CustomTextField(
                      //       textEditingController: bankNameTEC,
                      //       hint: 'Bank Account Number',
                      //       keyboardType: TextInputType.name,
                      //     ),
                      //   ),
                      // ),
                      // DocumentationImagePickerWidget(
                      //   textField: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: CustomTextField(
                      //       textEditingController: bankAccountNumberTEC,
                      //       hint: 'Bank Account Number',
                      //       keyboardType: TextInputType.number,
                      //     ),
                      //   ),
                      // ),
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
                  Fluttertoast.showToast(
                    msg:
                        'Thanks for signing up\n We will send you a verification email after checking your information.',
                    textColor: Colors.black,
                    backgroundColor: Colors.deepOrange,
                    fontSize: 20,
                    gravity: ToastGravity.CENTER_RIGHT,
                  );
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
