import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Login_Signup/login_screen.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  bool isObscured = true;
  bool isObscured2 = true;

  void clearFields() {
    firstNameController.clear();
    lastNameController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmController.clear();
    emailController.clear();
    contactNoController.clear();
  }

  Future<void> registerUser(
    String firstName,
    String lastName,
    String username,
    String password,
    String email,
    String contactNo,
    // String dob,
    // String battingStyle,
    // String bowlingStyle,
    // String role
    //http://127.0.0.1:8000/users/register/
    //https://cricknightz.pythonanywhere.com/users/register/
  ) async {
    //final url = Uri.parse('http://127.0.0.1:8000/users/register/');
    final url =
        Uri.parse('https://cricknightx.pythonanywhere.com/users/register/');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'FirstName': firstName,
        'LastName': lastName,
        'Username': username,
        'Password': password,
        'Email': email,
        'Contact_no': contactNo,
        'Dob': null,
        'Batting_style': null,
        'Bowling_style': null,
        'Role': null,
      }),
    );

    //print('Registration successful: ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Registration successful
      // Navigate to next screen or display success message
      print('Successfully Done');
      // ignore: use_build_context_synchronously
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Registration Successful'),
      //   type: ToastificationType.success,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 3),
      //   icon: const Icon(
      //     Icons.check_circle_outline_outlined,
      //     color: Colors.green,
      //   ),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
        ),
      );
      clearFields();
      // Registration successful
    } else if (response.statusCode == 400) {
      // Bad request (validation error)
      final jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('Username')) {
        // Username already exists
        print(jsonResponse['Username'][0]);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username already exists.'),
          ),
        );
        // ignore: use_build_context_synchronously
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Username already exists'),
        //   type: ToastificationType.info,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 3),
        //   icon: const Icon(
        //     Icons.info_outline,
        //     color: Colors.blue,
        //   ),
        // );
      } else if (jsonResponse.containsKey('Email')) {
        // Email already exists
        print(jsonResponse['Email'][0]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already exists.'),
          ),
        );
        // ignore: use_build_context_synchronously
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Email already exists'),
        //   type: ToastificationType.info,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 3),
        //   icon: const Icon(
        //     Icons.info_outline,
        //     color: Colors.blue,
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration Failed'),
          ),
        );
        // ignore: use_build_context_synchronously
        // toastification.show(
        //     showProgressBar: false,
        //     context: context,
        //     title: Text('Registration Failed'),
        //     type: ToastificationType.error,
        //     style: ToastificationStyle.minimal,
        //     alignment: Alignment.bottomCenter,
        //     autoCloseDuration: Duration(seconds: 3),
        //     icon: Icon(
        //       Icons.error,
        //       color: Colors.red,
        //     ));
      }

      // Registration failed
      // Display error message from responseData
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.80,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
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
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Firstname',
                      prefixIcon: Icon(Icons.person_outline),
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
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
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Lastname',
                      prefixIcon: Icon(Icons.person_outline),
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          //username
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                    hintStyle: TextStyle(
                      color: Color(0xFF8391A1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    hintStyle: TextStyle(
                      color: Color(0xFF8391A1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  controller: contactNoController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone',
                    prefixIcon: Icon(Icons.phone_outlined),
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
                  controller: passwordController,
                  obscureText: isObscured,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    // suffixIcon: Icon(
                    //   Icons.remove_red_eye,
                    //   color: Color(0xFF8391A1),
                    // ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                    ),

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
                  controller: confirmController,
                  obscureText: isObscured2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    // suffixIcon: Icon(
                    //   Icons.remove_red_eye,
                    //   color: Color(0xFF8391A1),
                    // ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscured2 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscured2 = !isObscured2;
                        });
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFF8391A1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                    color: kMyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {
                      final String firstName = firstNameController.text.trim();
                      final String lastName = lastNameController.text.trim();
                      final String username = usernameController.text.trim();
                      final String password = passwordController.text.trim();
                      final String confirm = confirmController.text.trim();
                      final String email = emailController.text.trim();
                      final String contactNo = contactNoController.text.trim();

                      if (firstName.isEmpty ||
                          lastName.isEmpty ||
                          username.isEmpty ||
                          password.isEmpty ||
                          confirm.isEmpty ||
                          email.isEmpty ||
                          contactNo.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill all required fields!!.'),
                          ),
                        );
                        // toastification.show(
                        //   showProgressBar: false,
                        //   context: context,
                        //   title: Text('Please fill all required fields!!'),
                        //   type: ToastificationType.warning,
                        //   style: ToastificationStyle.minimal,
                        //   alignment: Alignment.bottomCenter,
                        //   autoCloseDuration: Duration(seconds: 3),
                        //   icon: const Icon(
                        //     Icons.warning_outlined,
                        //     color: Colors.orange,
                        //   ),
                        // );
                      } else {
                        if (password == confirm) {
                          registerUser(firstName, lastName, username, password,
                              email, contactNo);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Password does not match!!.'),
                            ),
                          );
                          // toastification.show(
                          //     showProgressBar: false,
                          //     context: context,
                          //     title: Text('Password does not match!!.'),
                          //     type: ToastificationType.error,
                          //     style: ToastificationStyle.minimal,
                          //     alignment: Alignment.bottomCenter,
                          //     autoCloseDuration: Duration(seconds: 3),
                          //     icon: Icon(
                          //       Icons.error,
                          //       color: Colors.red,
                          //     ));
                        }
                      }
                    },

                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Register",
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
                "Already have an account? ",
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
                    color: const Color(0xFF35C2C1),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          //const Spacer()
        ],
      ),
    );
  }
}
