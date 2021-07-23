// extension EmailValidator on String {
//   static const pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//
//   bool isValidEmail({String pattern = pattern}) {
//     return RegExp(pattern).hasMatch(this);
//   }
//
//   bool isNotValidEmail({String pattern = pattern}) {
//     return !RegExp(pattern).hasMatch(this);
//   }
// }
//
// extension PasswordValidator on String {
//   static const pattern =
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//
//   bool isValidPassword({String pattern = pattern}) {
//     return RegExp(pattern).hasMatch(this);
//   }
//
//   bool isNotValidPassword({String pattern = pattern}) {
//     return !RegExp(pattern).hasMatch(this);
//   }
// }
//
// extension PhoneValidator on String {
//   static const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//
//   bool isValidPhone({String pattern = pattern}) {
//     return RegExp(pattern).hasMatch(this);
//   }
//
//   bool isNotValidPhone({String pattern = pattern}) {
//     return !RegExp(pattern).hasMatch(this);
//   }
// }
//
// //^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$
// extension DateValidator on String {
//   static const pattern =
//       r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
//
//   bool isValidDate({String pattern = pattern}) {
//     return RegExp(pattern).hasMatch(this);
//   }
//
//   bool isNotValidDate({String pattern = pattern}) {
//     return !RegExp(pattern).hasMatch(this);
//   }
// // bool isValidDate() {
// //   return null != DateTime.tryParse(this);
// // }
//
// // bool isNotValidDate() {
// //   return null == DateTime.tryParse(this);
// //   // return !RegExp(pattern).hasMatch(this);
// // }
// }
class Validator {
  String? validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String? validatePasswordLength(String value) {
    if (value.length == 0) {
      return "Password can't be empty";
    } else if (value.length < 10) {
      return "Password must be longer than 10 characters";
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
