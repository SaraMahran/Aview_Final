import 'dart:io';

import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController placeLocation = TextEditingController(text: ''),
      placePhoto = TextEditingController(text: ''),
      placeName = TextEditingController(text: ''),
      placeDescription = TextEditingController(text: ''),
      placeCategory = TextEditingController(text: ''),
      placePhone = TextEditingController(text: '');

  File? file;
  late String imageUrl;
  int x = 0;

  Future<void> pickImg() async {
    final pickedImg = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      setState(() {
        file = File(pickedImg.path);
      });
      Reference ref =
          FirebaseStorage.instance.ref().child("Place_photo${file!.path}");
      await ref.putFile(File(pickedImg.path));
      String imageUrl = await ref.getDownloadURL();
      this.imageUrl = imageUrl;
      print('imageUrl = $imageUrl');
      setState(() {});
    } else {
      print('failed load');
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
            onTap: () => pickImg(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          icon: Icons.phone,
                          textEditingController: placePhone,
                          hint: 'Place Phone Number',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          icon: Icons.description_outlined,
                          textEditingController: placeDescription,
                          hint: 'description',
                          keyboardType: TextInputType.name,
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
                onTap: () async {
                  print('pressed');
                  final Map<String, dynamic> data = {
                    'category': placeCategory.text,
                    'image': imageUrl,
                    'location': placeLocation.text,
                    'name': placeName.text,
                    'description': placeDescription.text,
                    'phone': placePhone.text
                  };

                  await FirebaseFirestore.instance
                      .collection('places')
                      .add(data);
                  Fluttertoast.showToast(
                    msg: "Added Done",
                    textColor: Colors.black,
                    backgroundColor: Colors.deepOrange,
                    fontSize: 20,
                    gravity: ToastGravity.CENTER_RIGHT,
                  );
                  Navigator.pop(context);
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
