import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/Team_screen.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Teams/AddTournament_Teams.dart';
//import 'package:shimmer/shimmer.dart';

class FindTeam extends StatefulWidget {
  final int? tourIdz;
  const FindTeam({Key? key, this.tourIdz}) : super(key: key);

  @override
  State<FindTeam> createState() => _FindTeamState();
}

class _FindTeamState extends State<FindTeam> {
  List<dynamic> teams = [];
  bool isLoading = false;
  String errorMessage = '';
  bool isAddTeamEnabled = true;

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      // final response =
      //     await http.get(Uri.parse('http://127.0.0.1:8000/tournamentTeams/'));
      final response = await http.get(
          Uri.parse('https://cricknightx.pythonanywhere.com/tournamentTeams/'));

      if (response.statusCode == 200) {
        setState(() {
          teams = json.decode(response.body);
          if (teams.length >= 6) {
            isAddTeamEnabled =
                false; // Disable "Add Team" button if already 6 teams
          }
        });
      } else {
        throw Exception('Failed to load teams');
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to fetch data. Please try again later.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Team',
                        prefixIcon: Icon(Icons.search),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      // Add search functionality if needed
                      onChanged: (value) {
                        // Implement search logic here
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      //color: kMyColor,
                      color: isAddTeamEnabled ? kMyColor : Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      child: Text(
                        'Add Team',
                        style: TextStyle(
                            color: isAddTeamEnabled
                                ? Colors.black54
                                : Colors.white),
                      ),
                      onPressed: isAddTeamEnabled
                          ? () {
                              // Implement add team functionality
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CreateTeamPage(
                                    tourId: widget.tourIdz!,
                                  );
                                },
                              ));
                            }
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            // Display error message if fetching failed
            if (errorMessage.isNotEmpty) Text(errorMessage),
            // Display loading indicator while fetching
            if (isLoading) CircularProgressIndicator(),
            // Display list of teams
            teams.isEmpty
                ? Center(child: Text('No data available'))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: teams.length,
                    itemBuilder: (context, index) {
                      final team = teams[index];
                      // Perform null check
                      if (team != null &&
                          team['Team_name'] != null &&
                          team['tournamentId'] == widget.tourIdz) {
                        return Container(
                          margin:
                              EdgeInsets.only(bottom: 10, right: 15, left: 15),
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.95,
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
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: kMyColor,
                              maxRadius: 30,
                              child: Icon(
                                Icons.group,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => TeamPlayer(
                                    teamData: team,
                                  ),
                                ),
                              );
                            },
                            title: Text(
                              'Team Name: ${team['Team_name']}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            subtitle: Text('Captain: ${team['Captain_name']}'),
                            trailing: Icon(
                              Icons.qr_code_outlined,
                              size: 25,
                            ),
                            titleTextStyle: TextStyle(fontSize: 23.0),
                            subtitleTextStyle: TextStyle(
                                fontSize: 15.0, color: Colors.black87),
                          ),
                        );
                      } else {
                        return Container(); // Return an empty container if team or name is null
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
