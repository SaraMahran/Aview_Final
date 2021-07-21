import 'package:aview2/components/documentation_image_picker_widget.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPlaceOwnerScreen extends StatelessWidget {
  final TextEditingController licenceNumberTEC =
          TextEditingController(text: ''),
      nationalIdNumberTEC = TextEditingController(text: ''),
      bankNameTEC = TextEditingController(text: ''),
      bankAccountNumberTEC = TextEditingController(text: ''),
      vehicleIdNumberTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: licenceNumberTEC,
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
                            textEditingController: nationalIdNumberTEC,
                            hint: 'National Id Number',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: vehicleIdNumberTEC,
                            hint: 'Vehicle Id Number',
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Bank Account Details',
                          style: theme.textTheme.headline2!.copyWith(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: bankNameTEC,
                            hint: 'Bank Account Number',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: bankAccountNumberTEC,
                            hint: 'Bank Account Number',
                            keyboardType: TextInputType.number,
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
            child: LoginButton(
              onTap: () {
                Fluttertoast.showToast(
                  msg: 'Thanks for signUp ',
                  textColor: Colors.black,
                  backgroundColor: Colors.orange,
                  fontSize: 20,gravity: ToastGravity.BOTTOM,
                );
              },
              buttonTitle: 'SignUp',
            ),
          ),
        ],
      ),
    );
  }
}
