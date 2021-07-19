import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  late final String hint;
  final Function? onClick;
  FormFieldValidator<String>? validator;
  TextEditingController? textEditingController;
  TextInputType? keyboardType;
  bool? obscureText;
  IconData? icon;
  double? _width;
  double? _pixelRatio;
  bool? large;
  bool? medium;

  CustomTextField(
      {required this.hint,
      this.textEditingController,
      required this.keyboardType,
      this.obscureText = true,
      required this.icon,
      this.validator,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large! ? 12 : (medium! ? 10 : 8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          controller: textEditingController,
          validator: validator,
          onSaved: (click) {},
          keyboardType: keyboardType,
          cursorColor: Colors.orange[200],
          obscureText: hint == "Password" ? true : false,
          decoration: InputDecoration(
            prefixIcon:
                Icon(icon, color: Colors.deepOrangeAccent[400], size: 20),
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_width', _width));
  }
}
// import 'dart:ui';
//
// import 'package:aview2/helper/helper_style.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'responsive_ui.dart';
//
// class CustomTextField extends StatelessWidget {
//   late final String hint;
//   final Function onClick;
//   TextEditingController? textEditingController;
//   TextInputType? keyboardType;
//   bool? obscureText;
//   IconData? icon;
//   double? _width;
//   double? _pixelRatio;
//   bool? large;
//   bool? medium;
//   String? errorMessage(String str) {
//     switch (hint) {
//       case "First Name":
//         return "First name is required";
//       case "Last Name":
//         return "Last name is required";
//       case "Email ":
//         return "Email is required";
//       case "Password":
//         return "Password is required";
//     }
//   }
//
//   CustomTextField(
//       {required this.hint,
//         this.textEditingController,
//         required this.keyboardType,
//         this.obscureText = true,
//         required this.icon,
//         required this.onClick});
//
//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
//     medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
//     return TextFormField(
//       controller: textEditingController,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return errorMessage(hint);
//         }
//         onSaved:
//         onClick;
//       },
//       keyboardType: keyboardType,
//       cursorColor: Colors.orange[200],
//       obscureText: hint == "Password" ? true : false,
//       decoration: kRoundedDecorationTF.copyWith(hintText: hint),
//     );
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DoubleProperty('_width', _width));
//   }
// }
