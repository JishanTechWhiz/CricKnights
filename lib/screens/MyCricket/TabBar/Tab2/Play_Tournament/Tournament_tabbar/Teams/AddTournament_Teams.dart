import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/Player_form.dart';

class CreateTeamPage extends StatefulWidget {
  final int tourId;
  const CreateTeamPage({Key? key, required this.tourId}) : super(key: key);

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final TextEditingController tournamentId = TextEditingController();
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController captainNameController = TextEditingController();
  final List<User> players = [];
  final List<String> selectedPlayerIds = [];

  @override
  void initState() {
    super.initState();
    fetchPlayers();
    tournamentId.text = widget.tourId.toString();
  }

  Future<void> fetchPlayers() async {
    //final response = await http.get(Uri.parse('http://127.0.0.1:8000/users/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/users/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        players.clear();
        players.addAll(data.map((user) => User.fromJson(user)).toList());
      });
    } else {
      print('Failed to fetch players');
    }
  }

  Future<void> createTeam(int tournamentID, String teamName, String captainName,
      List<String> playerIds) async {
    //final url = Uri.parse('http://127.0.0.1:8000/tournamentTeams/');
    final url =
        Uri.parse('https://cricknightx.pythonanywhere.com/tournamentTeams/');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'tournamentId': tournamentID,
        'Team_name': teamName,
        'Captain_name': captainName,
        'Players': playerIds,
      }),
    );

    if (response.statusCode == 201) {
      print('Team created successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Team created successfully'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Team created successfully'),
      //   type: ToastificationType.success,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 2),
      //   icon: const Icon(
      //     Icons.check_circle_outline_outlined,
      //     color: Colors.green,
      //   ),
      // );

      // Clear text field controllers and selected player IDs list
      teamNameController.clear();
      captainNameController.clear();
      // selectedPlayerIds.clear();
      setState(() {
        selectedPlayerIds.clear();
      });
    } else {
      print('Failed to create team');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create team'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Failed to create team'),
      //   type: ToastificationType.error,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 2),
      //   icon: Icon(
      //     Icons.error,
      //     color: Colors.red,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Team'),
        backgroundColor: kMyColor,
      ),
      backgroundColor: const Color(0xFFf0fff0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.width * 0.13,
                child: TextField(
                    readOnly: true,
                    controller: tournamentId,
                    decoration: const InputDecoration(
                      labelText: 'Match ID',
                      labelStyle: TextStyle(color: kMyColor, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kMyColor,
                      )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                          //width: 1.0,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            PlayeForm(
              f1name: 'Team Name',
              f2name: 'Captain Name',
              f1Controllers: teamNameController,
              f2Controllers: captainNameController,
            ),
            // TextField(
            //   controller: teamNameController,
            //   decoration: InputDecoration(labelText: 'Team Name'),
            // ),
            // TextField(
            //   controller: captainNameController,
            //   decoration: InputDecoration(labelText: 'Captain Name'),
            // ),
            const SizedBox(height: 16.0),
            const Text(
              'Select Players:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = players[index];
                  return Container(
                    child: CheckboxListTile(
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text('${user.role}'),
                      secondary: const Icon(Icons.person),
                      autofocus: false,
                      activeColor: kMyColor,
                      checkColor: Colors.white,
                      value: selectedPlayerIds.contains(user.username),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            selectedPlayerIds.add(user.username);
                          } else {
                            selectedPlayerIds.remove(user.username);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kMyColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {
                    final String teamName = teamNameController.text.trim();
                    final String captainName =
                        captainNameController.text.trim();
                    final int tournamentID = int.parse(tournamentId.text);
                    createTeam(
                        tournamentID, teamName, captainName, selectedPlayerIds);
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return TournamentBody();
                    //   },
                    // ));
                  },
                  child: const Text(
                    'Create Team',
                    style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Add space at the bottom
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String email;
  final int contactNo;
  final DateTime? dob;
  final String? battingStyle;
  final String? bowlingStyle;
  final String? role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.email,
    required this.contactNo,
    this.dob,
    this.battingStyle,
    this.bowlingStyle,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      username: json['Username'] ?? '',
      password: json['Password'] ?? '',
      email: json['Email'] ?? '',
      contactNo: json['Contact_no'] ?? 0,
      dob: json['Dob'] != null ? DateTime.parse(json['Dob']) : null,
      battingStyle: json['Batting_style'] ?? '',
      bowlingStyle: json['Bowling_style'] ?? '',
      role: json['Role'] ?? '',
    );
  }
}
