import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Login_Signup/password_created_screen.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Create new password",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.075,
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
                "Your new password must be unique from those previously used.",
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            //password
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F9),
                  border: Border.all(
                    color: const Color(0xFFE8ECF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //confirm password
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F9),
                  border: Border.all(
                    color: const Color(0xFFE8ECF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
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
                      //color: const Color(0xFF06d6a0),
                      color: kMyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (context) => const PasswordCreatedScreen(),
                          ),
                        );
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const PasswordCreatedScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Reset Password",
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
