import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Login_Signup/login_screen.dart';
import 'package:my_cricket/screens/Login_Signup/otp_screen.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  void clearFields() {
    emailController.clear();
  }

  void sendResetPasswordRequest(BuildContext context) async {
    final String email = emailController.text;

    final response = await http.post(
      // Uri.parse('http://127.0.0.1:8000/forgot_password/'),
      Uri.parse('https://cricknightx.pythonanywhere.com/forgot_password/'),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      // Password reset email sent successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent successfully.')),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Password reset email sent successfully.'),
      //   type: ToastificationType.success,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 3),
      //   icon: const Icon(
      //     Icons.check_circle_outline_outlined,
      //     color: Colors.green,
      //   ),
      // );
      clearFields();
    } else {
      // Error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send password reset email.')),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Failed to send password reset email'),
      //   type: ToastificationType.error,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 3),
      //   icon: Icon(
      //     Icons.error,
      //     color: Colors.red,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          // color: Colors.black,
          //color: Color(0xFF06d6a0)
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
                  "Forgot Password?",
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
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            //email
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                        sendResetPasswordRequest(context);
                        // Navigator.of(context).pushReplacement(
                        //   CupertinoPageRoute(
                        //     builder: (context) => const OTPScreen(),
                        //   ),
                        // );
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const OTPScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Send Email",
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Remember Password? ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      // color: Color(0xFF35C2C1),
                      // color: const Color(0xFF06d6a0),
                      color: kMyColor,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
