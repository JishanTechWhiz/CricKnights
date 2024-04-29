import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
import 'package:my_cricket/screens/Login_Signup/forgot_password_screen.dart';
import 'package:my_cricket/screens/Login_Signup/login_form.dart';
import 'package:my_cricket/screens/Login_Signup/register_screen.dart';
//import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(
      //     // color: Colors.black,
      //     color: Color(0xFF06d6a0),
      //   ),
      // ),
      body: SafeArea(
        //maintainBottomViewPadding: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: const Color(0xFF06d6a0),
          color: kMyColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginHead(context),
                LoginForm(),
                //loginBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget loginHead(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/l4.png',
          width: MediaQuery.of(context).size.width * 0.26,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            'Welcome back!',
            style: TextStyle(
                fontFamily: "Reggae One",
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

Widget loginBody(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.75,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      border: Border.all(
        color: Colors.white, // You can set the border color
        width: 1.0, // You can set the border width
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                // obscureText: _isObscured,
                decoration: const InputDecoration(
                  border: InputBorder.none,

                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock_outline),
                  hintStyle: TextStyle(
                    color: Color(0xFF8391A1),
                  ),
                  // suffixIcon: Icon(
                  //   Icons.remove_red_eye,
                  //   color: Color(0xFF8391A1),
                  // ),
                  //  suffixIcon: IconButton(
                  //     icon: Icon(
                  //       isObscured ? Icons.visibility : Icons.visibility_off,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         isObscured = !isObscured;
                  //       });
                  //     },
                  //   ),
                ),
              ),
            ),
          ),
        ),
        //forgot password
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );

                // Navigator.push(
                //   context,
                //   PageTransition(
                //     type: PageTransitionType.rightToLeft,
                //     duration: Duration(milliseconds: 500),
                //     reverseDuration: Duration(milliseconds: 500),
                //     child: const ForgotPasswordScreen(),
                //   ),
                // );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ForgotPasswordScreen()));
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xFF6A707C),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        //login button
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  //color: const Color(0xFF1E232C),
                  // color: const Color(0xFF06d6a0),
                  color: kMyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Login",
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: Color(0xFFE8ECF4),
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text("Or Login With"),
              ),
              Expanded(
                child: Divider(
                  color: Color(0xFFE8ECF4),
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black)
                    // color: Colors.red,
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: MediaQuery.of(context).size.height *
                          0.06, // Adjust the size as needed
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),

        // const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
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
                        builder: (context) => const RegisterScreen()));
              },
              child: Text(
                "Register",
                style: TextStyle(
                  //color: Color(0xFF35C2C1),
                  // color: Color(0xFF06d6a0),
                  color: kMyColor,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        //const Spacer(),
      ],
    ),
  );
}
