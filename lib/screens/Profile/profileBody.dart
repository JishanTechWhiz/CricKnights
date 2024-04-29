import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/screens/Login_Signup/login_screen.dart';
import 'package:my_cricket/screens/Profile/Profile_pic.dart';
import 'package:my_cricket/screens/Profile/profile_form.dart';
import 'package:my_cricket/screens/Profile/profile_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Profile",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfileForm(),
                ),
              ),
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              logoutUser(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> logoutUser(BuildContext context) async {
    // Show a confirmation dialog
    bool confirmLogout = await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Cancel"),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Logout"),
            ),
          ],
        );
      },
    );

    // If user confirms logout, proceed with logout process
    if (confirmLogout == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId'); // Remove the stored user ID
      // Navigate to the login screen or any other initial screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

      // Show logout success toast notification
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Logged out successfully'),
      //   type: ToastificationType.info,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 3),
      //   icon: const Icon(
      //     Icons.info_outline,
      //     color: Colors.black,
      //   ),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged out successfully')),
      );
    }
  }

  /*Future<void> logoutUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Remove the stored user ID
    // Navigate to the login screen or any other initial screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    toastification.show(
      showProgressBar: false,
      context: context,
      title: Text('Logged out successfully'),
      type: ToastificationType.info,
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: 3),
      icon: const Icon(
        Icons.info_outline,
        color: Colors.black,
      ),
    );
  }*/
}
