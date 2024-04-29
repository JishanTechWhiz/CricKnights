import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Login_Signup/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: const Color(0xFF06d6a0),
          color: kMyColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [regHeader(context), MyRegister()],
            ),
          ),
        ),
      ),
    );
  }
}

Widget regHeader(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.20,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Let's Get Started!",
          style: TextStyle(
              fontFamily: "Reggae One",
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Create an Account to access all features",
            style: TextStyle(
              // fontFamily: "Reggae One",
              fontSize: MediaQuery.of(context).size.width * 0.04,
              //fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    ),
  );
}
