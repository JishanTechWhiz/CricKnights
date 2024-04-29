import 'package:flutter/material.dart';
//import 'package:my_cricket/helpers/size_config.dart';

class ColorSys {
  static Color primary = const Color.fromRGBO(52, 43, 37, 1);
  static Color gray = const Color.fromRGBO(137, 137, 137, 1);
  static Color secoundry = const Color.fromRGBO(198, 116, 27, 1);
  static Color secoundryLight = const Color.fromRGBO(226, 185, 141, 1);
}

//  backgroundColor: Color(0xff0096c7)
//backgroundColor: Color(0xff0077b6),
// backgroundColor: Color(0xff99d98c),
// backgroundColor: Color(0xff2ec4b6),
// backgroundColor: Color(0xff00a8e8),

//const kPrimaryColor = Color(0xFFFF7643);
//const kPrimaryColor = Color(0xff185dcf);
const kPrimaryColorn = Color(0xFFFFC61F);
const ksecondaryColorn = Color(0xFFB5BFD0);
const kTextColorn = Color(0xFF50505D);
const kTextLightColorn = Color(0xFF6A727D);
const kWhite = Colors.white;

// const String filtterIcon = "assets/icons/adjust-horizontal-alt.svg";
// const String searchIcon = "assets/icons/search.svg";

// App Colors

// const kMyColor = Color(0xff6ecb96);
const kMyColor = Color(0xFF00B074);

const primarySwatch = Color(0xff1C6BA4);
const inputFillColor = Color(0xffEEF6FC);

const kPrimaryColors = Color(0xFFFFC61F);
const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColors = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

const kPrimaryColor = Color(0xff6175fa);

const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

//const kAnimationDuration = Duration(milliseconds: 200);

// final headingStyle = TextStyle(
//   fontSize: getProportionateScreenWidth(28),
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
//   height: 1.5,
// );

//const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// final otpInputDecoration = InputDecoration(
//   contentPadding:
//       EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
//     borderSide: const BorderSide(color: kTextColor),
//   );
// }
