import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighlightMatch extends StatefulWidget {
  const HighlightMatch({Key? key}) : super(key: key);

  @override
  State<HighlightMatch> createState() => _HighlightMatchState();
}

class _HighlightMatchState extends State<HighlightMatch> {
  final List<Map<int, String>> ballTypes = [
    {0: 'Select Ball'},
    {1: 'Tennis'},
    {2: 'Leather'},
    {3: 'Others'}
  ];
  List<Map<int, String>> pitchTypes = [
    {0: 'Select Pitchs'},
    {1: 'Rough'},
    {2: 'Cement'},
    {3: 'Turf'},
    {4: 'AstroTurf'},
    {5: 'Matting'}
  ];

  late Future<List<dynamic>> futureTournaments;
  late Future<List<dynamic>> futureScorecards;

  @override
  void initState() {
    super.initState();
    futureTournaments = fetchTournamentData();
    futureScorecards = fetchScorecardData();
  }

  Future<List<dynamic>> fetchTournamentData() async {
    try {
      // final response =
      //     await http.get(Uri.parse('/matches/'));
      final response = await http
          .get(Uri.parse('https://cricknightx.pythonanywhere.com/matches/'));
      if (response.statusCode == 200) {
        List<dynamic> tournaments = json.decode(response.body);

        // Fetch Team1 data
        // final cityResponse2 =
        //     await http.get(Uri.parse('http://127.0.0.1:8000/team/'));
        final cityResponse2 = await http
            .get(Uri.parse('https://cricknightx.pythonanywhere.com/team/'));
        if (cityResponse2.statusCode == 200) {
          Map<int, String> cityMap = Map.fromIterable(
            json.decode(cityResponse2.body),
            key: (city) => city['id'],
            value: (city) => city['Team_name'],
          );
          // Map city IDs to city names
          tournaments.forEach((tournament) {
            int? cityId = tournament['team_id'];
            tournament['Team_name'] =
                cityId != null ? cityMap[cityId] ?? 'Unknown' : 'Unknown';
          });
        } else {
          throw Exception('Failed to load city data');
        }

        // Fetch Team2 data
        // final cityResponse3 =
        //     await http.get(Uri.parse('http://127.0.0.1:8000/team/'));
        final cityResponse3 = await http
            .get(Uri.parse('https://cricknightx.pythonanywhere.com/team/'));
        if (cityResponse3.statusCode == 200) {
          Map<int, String> cityMap = Map.fromIterable(
            json.decode(cityResponse3.body),
            key: (city) => city['id'],
            value: (city) => city['Team_name'],
          );
          // Map city IDs to city names
          tournaments.forEach((tournament) {
            int? cityId = tournament['team_id2'];
            tournament['Team_name2'] =
                cityId != null ? cityMap[cityId] ?? 'Unknown' : 'Unknown';
          });
        } else {
          throw Exception('Failed to load city data');
        }

        // Fetch city data
        // final cityResponse =
        //     await http.get(Uri.parse('http://127.0.0.1:8000/cities/'));
        final cityResponse = await http
            .get(Uri.parse('https://cricknightx.pythonanywhere.com/cities/'));
        if (cityResponse.statusCode == 200) {
          Map<int, String> cityMap = Map.fromIterable(
            json.decode(cityResponse.body),
            key: (city) => city['id'],
            value: (city) => city['cityName'],
          );
          // Map city IDs to city names
          tournaments.forEach((tournament) {
            int? cityId = tournament['city'];
            tournament['cityName'] =
                cityId != null ? cityMap[cityId] ?? 'Unknown' : 'Unknown';
          });
        } else {
          throw Exception('Failed to load city data');
        }

        // Fetch ground data
        // final groundResponse =
        //     await http.get(Uri.parse('http://127.0.0.1:8000/grounds/'));
        final groundResponse = await http
            .get(Uri.parse('https://cricknightx.pythonanywhere.com/grounds/'));
        if (groundResponse.statusCode == 200) {
          Map<int, String> groundMap = Map.fromIterable(
            json.decode(groundResponse.body),
            key: (ground) => ground['id'],
            value: (ground) => ground['groundName'],
          );
          // Map ground IDs to ground names
          tournaments.forEach((tournament) {
            int? groundId = tournament['ground_id'];
            tournament['groundName'] =
                groundId != null ? groundMap[groundId] ?? 'Unknown' : 'Unknown';
          });
        } else {
          throw Exception('Failed to load ground data');
        }

        return tournaments;
      } else {
        throw Exception('Failed to load tournament data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<dynamic>> fetchScorecardData() async {
    try {
      // final response =
      //     await http.get(Uri.parse('http://127.0.0.1:8000/scorerdetails/'));
      final response = await http.get(
          Uri.parse('https://cricknightx.pythonanywhere.com/scorerdetails/'));
      if (response.statusCode == 200) {
        List<dynamic> scorecards = json.decode(response.body);

        return scorecards;
      } else {
        throw Exception('Failed to load scorecard data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: FutureBuilder<List<dynamic>>(
        //future: futureTournaments,
        future: Future.wait([
          futureTournaments,
          futureScorecards,
          SharedPreferences.getInstance()
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            //List<dynamic> tournaments = snapshot.data!;

            List<dynamic> tournaments = snapshot.data![0];
            List<dynamic> scorecards = snapshot.data![1];
            SharedPreferences prefs = snapshot.data![2];

            int? userId = prefs.getInt('userId');
            // Filter tournaments based on userId
            tournaments = tournaments
                .where((tournament) => tournament['userId'] == userId)
                .toList();

            if (tournaments.isEmpty) {
              return Center(child: Text('No data available'));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: tournaments.length,
              itemBuilder: (context, index) {
                DateTime dateTime =
                    DateTime.parse(tournaments[index]['dateTime']);
                String formattedDate =
                    DateFormat.yMMMd().format(dateTime); // Date
                String formattedTime = DateFormat.Hm().format(dateTime);
                int matchId = tournaments[index]['id'];
                List<dynamic> filteredScorecards = scorecards
                    .where((scorecard) => scorecard['matchId'] == matchId)
                    .toList();
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes the shadow direction
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${tournaments[index]['match_type'] ?? ''}',
                              style: const TextStyle(fontSize: 17.0),
                            ),
                            Text(
                              '${tournaments[index]['groundName'] ?? 'Unknown'},${tournaments[index]['cityName'] ?? 'Unknown'} | ${formattedDate} | ${tournaments[index]['noOfOvers'] ?? ''} Ov.',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        //------------------
                        for (var score in filteredScorecards)
                          Column(
                            children: [
                              ListTile(
                                leading: Text(
                                  '${tournaments[index]['Team_name'] ?? ''}',
                                  style: const TextStyle(
                                      fontSize: 17.0, color: Color(0xFF06d6a0)),
                                ),
                                trailing: Text(
                                  '${score['firstInnings_totalRuns']}/${score['firstInnings_totalWicket']}(3.0 ov)',
                                  style: const TextStyle(
                                      fontSize: 17.0, color: Color(0xFF06d6a0)),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  '${tournaments[index]['Team_name2'] ?? ''}',
                                  style: const TextStyle(
                                      fontSize: 17.0, color: Color(0xFF06d6a0)),
                                ),
                                trailing: Text(
                                  '${score['secondInnings_totalRuns']}/${score['secondInnings_totalWicket']}(3.0 ov)',
                                  style: const TextStyle(
                                      fontSize: 17.0, color: Color(0xFF06d6a0)),
                                ),
                              ),
                            ],
                          ),
                        //-----------------------
                        const Divider(
                          color: Colors.black38,
                        ),
                        for (var score in filteredScorecards)
                          if (score['firstInnings_totalRuns'] >
                              score['secondInnings_totalRuns'])
                            Text(
                              '${score['winnerTeam']} won by ${score['firstInnings_totalRuns'] - score['secondInnings_totalRuns']} runs',
                              style: const TextStyle(
                                  fontSize: 17.0, color: Color(0xFF06d6a0)),
                            )
                          else if (score['secondInnings_totalRuns'] >
                              score['firstInnings_totalRuns'])
                            Text(
                              '${score['winnerTeam']} won by ${score['secondInnings_totalRuns'] - score['firstInnings_totalRuns']} runs',
                              style: const TextStyle(
                                  fontSize: 17.0, color: Color(0xFF06d6a0)),
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
