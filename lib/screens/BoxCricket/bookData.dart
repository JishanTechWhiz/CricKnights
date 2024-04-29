import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class BookingDetailsPage extends StatefulWidget {
  BookingDetailsPage({
    super.key,
  });

  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  List<Map<String, dynamic>> bookingDetails = [];
  bool isLoading = true;
  late Future<List<Map<String, dynamic>>> futureBoxGrounds;
  late int authenticatedUserId; // Variable to store authenticated user ID

  @override
  void initState() {
    super.initState();
    futureBoxGrounds = fetchBoxGrounds();
    getUserFromSharedPreferences(); // Call method to get user ID from SharedPreferences
  }

  // Method to get authenticated user ID from SharedPreferences
  Future<void> getUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authenticatedUserId =
        prefs.getInt('userId') ?? 0; // Assuming user ID is stored as an integer
    setState(() {});
  }

  Future<List<Map<String, dynamic>>> fetchBoxGrounds() async {
    //final response =
    //await http.get(Uri.parse('http://127.0.0.1:8000/booking/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/booking/'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> getGroundNameById(int groundId) async {
    // final response =
    //     await http.get(Uri.parse('http://127.0.0.1:8000/boxgrounds'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/boxgrounds/'));
    if (response.statusCode == 200) {
      List<dynamic> groundsData = json.decode(response.body);

      for (var groundData in groundsData) {
        if (groundData['groundId'] == groundId) {
          print(groundData['groundName']);
        }
      }
      throw Exception('Ground with ID $groundId not found');
    } else {
      throw Exception('Failed to load ground data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        backgroundColor: kMyColor,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureBoxGrounds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var booking = snapshot.data![index];

                // Only display bookings for authenticated user
                if (authenticatedUserId == booking['user']) {
                  return Container(
                    padding: AppTheme.padding,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            child: Row(
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio: 1.2,
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Stack(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffE1E2E4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 14,
                                        left: 6,
                                        // left: -20,
                                        // bottom: -20,
                                        child: Image.asset(
                                          'assets/images/g1.png',
                                          height: 58,
                                          width: 58,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      'Ground ID:${booking["ground"]}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Center(child: Text(booking["date"])),
                                        Center(
                                            child: Text(booking["time_slot"])),
                                        Center(
                                          child: Text(
                                            '${booking["price"]}/-',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                    trailing: Container(
                                      width: 65,
                                      height: 36,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              Color(0xffE1E2E4).withAlpha(150),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // child: const TitleText(
                                      //   text: 'pending',
                                      //   color: Color(0xffF72804),
                                      //   fontSize: 12,
                                      // ),
                                      child: Text(
                                        booking["status"],
                                        style: TextStyle(
                                            color: Color(0xffF72804),
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const Divider(
                            thickness: 1,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  // If user ID doesn't match, return an empty container
                  return Container();
                }
              },
            );
          }
        },
      ),
    );
  }
}
