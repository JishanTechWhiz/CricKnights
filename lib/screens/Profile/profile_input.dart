import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/Profile/Profile_pic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileInput extends StatefulWidget {
  const ProfileInput({super.key});

  @override
  State<ProfileInput> createState() => _ProfileInputState();
}

class _ProfileInputState extends State<ProfileInput> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController battingStyleController = TextEditingController();
  TextEditingController bowlingStyleController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  late Future<Map<String, dynamic>> userDataFuture;

  @override
  void initState() {
    super.initState();
    userDataFuture = fetchUserData();
    setInitialUserData();
  }

  Future<void> setInitialUserData() async {
    try {
      // Fetch user data from the API
      Map<String, dynamic> userData = await userDataFuture;
      // Set user data to the text controllers
      firstNameController.text = userData['FirstName'];
      lastNameController.text = userData['LastName'];
      emailController.text = userData['Email'];
      phoneController.text = userData['Contact_no'].toString();
      battingStyleController.text = userData['Batting_style'];
      bowlingStyleController.text = userData['Bowling_style'];
      roleController.text = userData['Role'];
      dobController.text = userData['Dob'];
    } catch (e) {
      print('Error setting initial user data: $e');
    }
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    try {
      if (userId != null) {
        // final url = Uri.parse('http://127.0.0.1:8000/users/');
        final url = Uri.parse('https://cricknightx.pythonanywhere.com/users/');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // Parse the JSON response
          final List<dynamic> userList = jsonDecode(response.body);
          // Filter the user data based on the user ID
          Map<String, dynamic>? userData = userList.firstWhere(
            (user) => user['id'] == userId,
            orElse: () => null,
          );
          if (userData != null) {
            return userData;
          } else {
            throw Exception('User data not found for user ID: $userId');
          }
        } else {
          throw Exception('Failed to load user data');
        }
      } else {
        throw Exception('User ID not available');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),

            //0
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Container(
                    height: 57,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      //color: const Color(0xFFF7F8F9),
                      color: const Color(0xFFF5F6F9),
                      border: Border.all(
                        color: kMyColor,
                        // color: Color(0xFFF5F6F9),
                      ),
                      borderRadius: BorderRadius.circular(6),
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
                          hintText: 'First Name',
                          //labelText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person_outline,
                            //color: kMyColor,
                            size: 25,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: 57,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      //color: const Color(0xFFF7F8F9),
                      color: const Color(0xFFF5F6F9),
                      border: Border.all(
                        color: kMyColor,
                        // color: Color(0xFFF5F6F9),
                      ),
                      borderRadius: BorderRadius.circular(6),
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
                          hintText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person_outline,
                            //color: kMyColor,
                            size: 25,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //1
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            //0
            // Container(
            //   height: 57,
            //   width: MediaQuery.of(context).size.width * 0.45,
            //   decoration: BoxDecoration(
            //     //color: const Color(0xFFF7F8F9),
            //     color: const Color(0xFFF5F6F9),
            //     border: Border.all(
            //       color: kMyColor,
            //       // color: Color(0xFFF5F6F9),
            //     ),
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //       left: 10,
            //       right: 10,
            //     ),
            //     child: TextFormField(
            //       controller: lastNameController,
            //       decoration: const InputDecoration(
            //         border: InputBorder.none,
            //         hintText: 'Last Name',
            //         prefixIcon: Icon(
            //           Icons.person_outline,
            //           //color: kMyColor,
            //           size: 25,
            //         ),
            //         hintStyle: TextStyle(
            //           color: Colors.black54,
            //           fontSize: 17,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //1
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  //color: const Color(0xFFF7F8F9),
                  color: const Color(0xFFF5F6F9),
                  border: Border.all(
                    color: kMyColor,
                    // color: Color(0xFFF5F6F9),
                  ),
                  borderRadius: BorderRadius.circular(6),
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
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        //color: kMyColor,
                        size: 25,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //2
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  //color: const Color(0xFFF7F8F9),
                  color: const Color(0xFFF5F6F9),
                  border: Border.all(
                    color: kMyColor,
                    // color: Color(0xFFF5F6F9),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone',
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        //color: kMyColor,
                        size: 25,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //2
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  //color: const Color(0xFFF7F8F9),
                  color: const Color(0xFFF5F6F9),
                  border: Border.all(
                    color: kMyColor,
                    // color: Color(0xFFF5F6F9),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DOB',
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        //color: kMyColor,
                        size: 25,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Container(
                    height: 57,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      //color: const Color(0xFFF7F8F9),
                      color: const Color(0xFFF5F6F9),
                      border: Border.all(
                        color: kMyColor,
                        // color: Color(0xFFF5F6F9),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        controller: battingStyleController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Batting Style',
                          prefixIcon: Icon(
                            Icons.sports_cricket,
                            //color: kMyColor,
                            size: 25,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //2
                  Container(
                    height: 57,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      //color: const Color(0xFFF7F8F9),
                      color: const Color(0xFFF5F6F9),
                      border: Border.all(
                        color: kMyColor,
                        // color: Color(0xFFF5F6F9),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: TextFormField(
                        controller: bowlingStyleController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Bowling Style',
                          prefixIcon: Icon(
                            Icons.sports_baseball_outlined,
                            //color: kMyColor,
                            size: 25,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //2
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  //color: const Color(0xFFF7F8F9),
                  color: const Color(0xFFF5F6F9),
                  border: Border.all(
                    color: kMyColor,
                    // color: Color(0xFFF5F6F9),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: roleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Role',
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        //color: kMyColor,
                        size: 25,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
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
                      color: kMyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onPressed: () {
                        updateUserProfile();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomeScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Update",
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

  Future<void> updateUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    //int userId = 60; // Example user ID

    Map<String, dynamic> userData = {
      'FirstName': firstNameController.text,
      'LastName': lastNameController.text,
      'Email': emailController.text,
      'Contact_no': phoneController.text,
      'Dob': dobController.text,
      'Batting_style': battingStyleController.text,
      'Bowling_style': bowlingStyleController.text,
      'Role': roleController.text,
    };

    //String apiUrl = 'http://localhost:8000/api/user/update_profile/$userId/';

    try {
      var response = await http.post(
        // Uri.parse('http://localhost:8000/update_profile/$userId/'),
        Uri.parse(
            'https://cricknightx.pythonanywhere.com/update_profile/$userId/'),
        body: userData,
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Profile updated successfully'),
        //   type: ToastificationType.success,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 2),
        //   icon: const Icon(
        //     Icons.check_circle_outline_outlined,
        //     color: Colors.green,
        //   ),
        // );
        // Handle success, e.g., show a success dialog or navigate back
      } else {
        print('Failed to update profile. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile')),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Failed to update profile'),
        //   type: ToastificationType.error,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 2),
        //   icon: Icon(
        //     Icons.error,
        //     color: Colors.red,
        //   ),
        // );

        // Handle failure, e.g., show an error dialog
      }
    } catch (error) {
      print('Error occurred while updating profile: $error');
      // Handle error, e.g., show an error dialog
    }
  }
}
