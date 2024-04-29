import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class FixtureMatches extends StatefulWidget {
  @override
  _FixtureMatchesState createState() => _FixtureMatchesState();
}

class _FixtureMatchesState extends State<FixtureMatches> {
  List<dynamic> matches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    //final String apiKey = "c8c0ffc4-74c1-4a6c-9a01-00ab58f0cdcb";
    final String apiKey = "3784b6ba-6753-43d3-9703-3f1b5df3adc8";
    final String url = "https://api.cricapi.com/v1/cricScore?apikey=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> allMatches = json.decode(response.body)["data"];
      List<dynamic> iplMatches = [];

      // Filter out only IPL matches
      allMatches.forEach((match) {
        String team1 = match["t1"];
        String team2 = match["t2"];
        if (isIPLTeam(team1) && isIPLTeam(team2)) {
          iplMatches.add(match);
        }
      });

      setState(() {
        matches = iplMatches;
        matches.sort((a, b) {
          DateTime dateTimeA = DateTime.parse(a['dateTimeGMT']);
          DateTime dateTimeB = DateTime.parse(b['dateTimeGMT']);
          return dateTimeA.compareTo(dateTimeB);
        });
        isLoading = false; // Set isLoading to false when data is loaded
      });
    } else {
      throw Exception('Failed to load matches');
    }
  }

  bool isIPLTeam(String team) {
    return team.contains("Chennai Super Kings [CSK]") ||
        team.contains("Delhi Capitals [DC]") ||
        team.contains("Kolkata Knight Riders [KKR]") ||
        team.contains("Mumbai Indians [MI]") ||
        team.contains("Punjab Kings [PBKS]") ||
        team.contains("Rajasthan Royals [RR]") ||
        team.contains("Royal Challengers Bengaluru [RCB]") ||
        team.contains("Sunrisers Hyderabad [SRH]") ||
        team.contains("Lucknow Super Giants [LSG]") ||
        team.contains("Gujarat Titans [GT]");
  }

  String getShortTeamName(String fullName) {
    // Extract the short name from the full name
    // Assume short name is in square brackets
    int startIndex = fullName.lastIndexOf('[');
    int endIndex = fullName.lastIndexOf(']');
    if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
      return fullName.substring(startIndex + 1, endIndex);
    }
    // Return full name if short name not found
    return fullName;
  }

  String getFullTeamName(String fullName) {
    // Extract the full name from the string by removing the abbreviation in square brackets
    int startIndex = fullName.lastIndexOf('[');
    if (startIndex != -1) {
      return fullName.substring(0, startIndex).trim();
    }
    // Return the original string if abbreviation not found
    return fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(), // Show loading indicator
            )
          : ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                var match = matches[index];
                String dateTimeString = match['dateTimeGMT'];
                DateTime dateTime = DateTime.parse(dateTimeString);

// Format date
                String formattedDate = DateFormat('d, MMM, y').format(dateTime);

// Format time
                String formattedTime = DateFormat('hh:mm a').format(dateTime);

                if (match['ms'] == "fixture") {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            spreadRadius: 7,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date: $formattedDate",
                                // getFullTeamName(match['t1']) +
                                //     ' Vs ' +
                                //     getFullTeamName(match['t2']),
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 17),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              child:
                                                  Image.network(match['t1img']),
                                              height: 30),
                                          SizedBox(width: 15),
                                          Text(
                                            getShortTeamName(match['t1']),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            match['t1s'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(
                                              child:
                                                  Image.network(match['t2img']),
                                              height: 30),
                                          SizedBox(width: 15),
                                          Text(
                                            getShortTeamName(match['t2']),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            match['t2s'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          height: 40,
                                          width: 3,
                                          color: Colors.grey),
                                      const SizedBox(width: 15),
                                      Container(
                                          height: 25,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              'NEXT',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            match['status'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink(); // Hide the match if it's not live
                }
              },
            ),
    );
  }
}
