import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  List<Map<String, dynamic>> userData = [];
  bool isLoading = true; // Add loading indicator state

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    if (userId != null) {
      var headers = {
        'Content-Type': 'application/json',
        'userId': userId.toString()
      };

      try {
        var response = await http.get(
          Uri.parse('http://192.168.64.175:8000/users/'),
          headers: headers,
        );

        if (response.statusCode == 200) {
          // Request successful, handle response data
          List<Map<String, dynamic>> userDataList = [];
          List<dynamic> jsonList = json.decode(response.body);

          // Filter user data based on userId
          jsonList.forEach((element) {
            if (element['id'] == userId) {
              userDataList.add(Map<String, dynamic>.from(element));
            }
          });

          setState(() {
            userData = userDataList;
            isLoading = false; // Update loading indicator state
          });
        } else {
          // Request failed, handle error
          print('Failed to fetch user data: ${response.statusCode}');
          setState(() {
            isLoading = false; // Update loading indicator state
          });
        }
      } catch (e) {
        // Catch any exceptions
        print('Exception while fetching user data: $e');
        setState(() {
          isLoading = false; // Update loading indicator state
        });
      }
    } else {
      // User ID not found in SharedPreferences, handle error
      print('User ID not found');
      setState(() {
        isLoading = false; // Update loading indicator state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : userData.isEmpty
              ? Center(
                  child: Text('No user data available.'),
                )
              : ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userData[index]['Username'] ?? 'No username'),
                      subtitle: Text(userData[index]['id'] != null
                          ? 'ID: ${userData[index]['id']}'
                          : 'No ID'),
                      // Add more widgets to display other user data as needed
                    );
                  },
                ),
    );
  }
}
