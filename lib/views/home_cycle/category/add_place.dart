import 'dart:io';

import 'package:aview2/components/documentation_image_picker_widget.dart';
import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController placeLocation = TextEditingController(text: ''),
      placePhoto = TextEditingController(text: ''),
      placeName = TextEditingController(text: ''),
      placeEmail = TextEditingController(text: ''),
      placeCategory = TextEditingController(text: ''),
      placePhone = TextEditingController(text: '');

  File? file;

  Future<void> pickImg() async {
    final pickedImg = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      setState(() {
        file = File(pickedImg.path);
      });
      // Reference ref = FirebaseStorage.instance.ref().child("Place_photo");
      // await ref.putFile(File(pickedImg.path));
      // String imageUrl = await ref.getDownloadURL();
      // print('imageUrl = $imageUrl');

    } else {
      print('Canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Add Place',
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: pickImg,
            child: Container(
              child: file != null
                  ? Image.file(
                      file!,
                      width: 80,
                      height: 80,
                    )
                  : Icon(Icons.add_a_photo, size: 100),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Place Information',
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
                          icon: Icons.place,
                          hint: "Place Name",
                          textEditingController: placeName,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: Icons.place,
                          hint: "Place Category",
                          textEditingController: placeCategory,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (CustomTextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          icon: Icons.place,
                          hint: "Place location",
                          textEditingController: placeLocation,
                        )),
                      ),
                      // DocumentationImagePickerWidget(
                      //   textField: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: CustomTextField(
                      //       textEditingController: licenceNumberTEC,
                      //       icon: FontAwesomeIcons.paperclip,
                      //       hint: 'Place Licence',
                      //       keyboardType: TextInputType.number,
                      //       // icon: Icons.email,
                      //     ),
                      //   ),
                      //),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: placePhoto,
                            icon: Icons.photo,
                            hint: 'Place Photo',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            textEditingController: placeEmail,
                            icon: Icons.email,
                            hint: 'Place Email ',
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
                      DocumentationImagePickerWidget(
                        textField: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                            icon: Icons.phone,
                            textEditingController: placePhone,
                            hint: 'Place Phone Number',
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
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
                  Map<String, dynamic> data = {
                    "category": placeCategory,
                    "location": placeLocation,
                    "noOfReviewers": null,
                  };
                  // Fluttertoast.showToast(
                  //   msg:
                  //       "Thanks for contributing to our system.\n We will send you a verification email after checking the place's information.",
                  //   textColor: Colors.black,
                  //   backgroundColor: Colors.deepOrange,
                  //   fontSize: 20,
                  //   gravity: ToastGravity.CENTER_RIGHT,
                  // );
                },
                buttonTitle: 'Add Place',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
