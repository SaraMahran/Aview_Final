import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentationImagePickerWidget extends StatefulWidget {
  final Widget textField;

  DocumentationImagePickerWidget({
    required this.textField,
  });

  @override
  _DocumentationImagePickerWidgetState createState() =>
      _DocumentationImagePickerWidgetState();
}

class _DocumentationImagePickerWidgetState
    extends State<DocumentationImagePickerWidget> {
  File? file;

  Future<void> pickImg() async {
    final pickedImg = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedImg != null) {
      print('picked');
      setState(() {
        file = File(pickedImg.path);
      });
      print('pickedImgPath = ${file!.path}');
    } else {
      print('Canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(child: widget.textField),
        GestureDetector(
          onTap: pickImg,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orange),
            ),
            child: file != null
                ? Image.file(file!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill)
                : Row(
                    children: [
                      Text('Upload ', style: theme.textTheme.subtitle2),
                      Icon(Icons.add_a_photo)
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
