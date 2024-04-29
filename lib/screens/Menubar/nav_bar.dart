import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cricket/screens/BoxCricket/Box_Screen.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
import 'package:my_cricket/screens/Login_Signup/login_screen.dart';
import 'package:my_cricket/screens/Menubar/contactus.dart';
import 'package:my_cricket/screens/MyCricket/cricket_screen.dart';
import 'package:my_cricket/screens/NotFound/notFound.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late Future<Map<String, dynamic>> userDataFuture;

  @override
  void initState() {
    super.initState();
    userDataFuture = fetchUserData();
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: userDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('');
              } else if (snapshot.hasError) {
                return Text('');
              } else if (snapshot.hasData && snapshot.data != null) {
                Map<String, dynamic> userData = snapshot.data!;
                return UserAccountsDrawerHeader(
                  accountName: Text(userData['Username'] ?? ''),
                  accountEmail: Text(userData['Email'] ?? ''),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/i2.png'),
                    ),
                  ),
                );
              } else {
                return Text('No data available');
              }
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.userGroup,
              size: 20,
            ),
            title: const Text('Match'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CricketScreen()));
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.trophy,
              size: 20,
            ),
            title: const Text('Tournament'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CricketScreen()));
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
            title: Text('Box Cricket'),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BoxCricket()))
            },
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.school,
              size: 20,
            ),
            title: const Text('Cricket Academy'),
            onTap: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NotFoundPage()))
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.phone_outlined, size: 23.0),
            title: const Text('Contact-Us'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Contact();
                },
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer_outlined, size: 23.0),
            title: const Text('About-Us'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: Icon(Icons.logout_outlined, size: 23.0),
            onTap: () {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged out successfully')),
      );
    }
  }
}
