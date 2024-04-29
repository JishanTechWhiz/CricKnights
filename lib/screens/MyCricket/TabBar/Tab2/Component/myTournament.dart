import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/single_tournament.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/tournament_tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTournament extends StatefulWidget {
  const MyTournament({super.key});

  @override
  State<MyTournament> createState() => _MyTournamentState();
}

class _MyTournamentState extends State<MyTournament> {
  late Future<List<dynamic>> futureTournaments;

  @override
  void initState() {
    super.initState();
    futureTournaments = fetchTournamentData();
  }

  Future<List<dynamic>> fetchTournamentData() async {
    // final response =
    //     await http.get(Uri.parse('http://127.0.0.1:8000/tournaments/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/tournaments/'));
    if (response.statusCode == 200) {
      List<dynamic> tournaments = json.decode(response.body);
      // Fetch city data
      // final cityResponse =
      //     await http.get(Uri.parse('http://127.0.0.1:8000/cities/'));
      final cityResponse = await http
          .get(Uri.parse('https://cricknightx.pythonanywhere.com/cities/'));
      if (cityResponse.statusCode == 200) {
        Map<int, String> cityMap = Map.fromIterable(
            json.decode(cityResponse.body),
            key: (city) => city['id'],
            value: (city) => city['cityName']);
        // Map city IDs to city names
        tournaments.forEach((tournament) {
          int cityId = tournament['city'];
          if (cityMap.containsKey(cityId)) {
            tournament['cityName'] = cityMap[cityId];
          } else {
            tournament['cityName'] = 'Unknown'; // or any other fallback value
          }
        });
        return tournaments;
      } else {
        throw Exception('Failed to load city data');
      }
    } else {
      throw Exception('Failed to load tournament data');
    }
  }

  // Future<List<dynamic>> fetchTournamentData() async {
  //   final response =
  //       await http.get(Uri.parse('http://127.0.0.1:8000/tournaments/'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load tournament data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: FutureBuilder<List<dynamic>>(
        //future: futureTournaments,
        future:
            Future.wait([futureTournaments, SharedPreferences.getInstance()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            //List<dynamic> tournaments = snapshot.data!;
            List<dynamic> tournaments = snapshot.data![0];
            SharedPreferences prefs =
                snapshot.data![1]; // Retrieve SharedPreferences
            int? userId =
                prefs.getInt('userId'); // Get userId from SharedPreferences

            // Filter tournaments based on userId
            tournaments = tournaments
                .where((tournament) => tournament['userId'] == userId)
                .toList();

            return tournaments.isEmpty
                ? Center(child: Text('No data available'))
                : ListView.builder(
                    itemCount: tournaments.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15, top: 20),
                          height: MediaQuery.of(context).size.height * 0.38,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes the shadow direction
                                ),
                              ]),
                          child: Stack(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.95,

                                child: Image.asset(
                                  'assets/images/i2.png',
                                  fit: BoxFit.cover,
                                ),
                                // color: Colors.grey.shade300,
                                //child: ,
                              ),
                              Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.70,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red.shade400,
                                    ),
                                    child: const Center(child: Text('ONGOING')),
                                  )),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.20,
                                left: MediaQuery.of(context).size.width * 0.03,
                                child: Text(
                                  tournaments[index]['tournamentName'],
                                  style: TextStyle(
                                      fontSize: 19.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.27,
                                left: MediaQuery.of(context).size.width * 0.03,
                                child: Text(
                                  '${tournaments[index]['startDate']} to ${tournaments[index]['endDate']}',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.30,
                                left: MediaQuery.of(context).size.width * 0.03,
                                child: Text(
                                  '${tournaments[index]['cityName'] ?? 'Unknown'}',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.27,
                                left: MediaQuery.of(context).size.width * 0.70,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      // foregroundColor: Colors.white,
                                      // backgroundColor: Colors.blue, // Background color
                                      side: BorderSide(
                                          color:
                                              kMyColor), // Outline border color
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TournamentTabbar(
                                                    tournamentData: tournaments,
                                                    selectIndex: index,
                                                    tournamentId:
                                                        tournaments[index]
                                                            ['id'],
                                                  )));
                                    },
                                    child: const Text(
                                      'Show',
                                      style: TextStyle(color: kMyColor),
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
