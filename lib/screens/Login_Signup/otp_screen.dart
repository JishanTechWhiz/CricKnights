import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:pinput/pinput.dart';

import 'package:my_cricket/screens/Login_Signup/create_password_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PinTheme defaultTheme = PinTheme(
      height: MediaQuery.of(context).size.height * 0.100,
      width: MediaQuery.of(context).size.width * 0.180,
      textStyle: const TextStyle(
        fontSize: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    PinTheme focusedTheme = PinTheme(
      height: MediaQuery.of(context).size.height * 0.100,
      width: MediaQuery.of(context).size.width * 0.180,
      textStyle: const TextStyle(
        fontSize: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          // color: const Color(0xFF35C2C1),
          // color: const Color(0xFF06d6a0),
          color: kMyColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          // color: Colors.black,
          // color: Color(0xFF06d6a0),
          color: kMyColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Enter the verification code we just sent on your email address.",
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              children: [
                Expanded(
                  child: Pinput(
                    defaultPinTheme: defaultTheme,
                    focusedPinTheme: focusedTheme,
                    submittedPinTheme: focusedTheme,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                        Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (context) => const CreatePasswordScreen(),
                          ),
                        );

                        // MaterialPageRoute(
                        //     builder: (context) =>
                        //         const CreatePasswordScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Verify",
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn’t received code? ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      //color: const Color(0xFF35C2C1),
                      color: kMyColor,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
