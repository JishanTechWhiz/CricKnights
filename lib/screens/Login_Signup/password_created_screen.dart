import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

import 'package:my_cricket/screens/Login_Signup/login_screen.dart';

class PasswordCreatedScreen extends StatelessWidget {
  const PasswordCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/tick.png",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Password Changed!",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.075,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Your password has been changed successfully.",
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            //register button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      // color: const Color(0xFF1E232C),
                      // color: const Color(0xFF06d6a0),
                      color: kMyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(
                        //   CupertinoPageRoute(
                        //     builder: (context) => const LoginScreen(),
                        //   ),
                        // );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Back to Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
