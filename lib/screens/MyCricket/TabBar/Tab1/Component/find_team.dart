// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:my_cricket/helpers/constants.dart';
// import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage.dart';
// import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/Team_screen.dart';

// class FindTeam extends StatelessWidget {
//   const FindTeam({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf0fff0),
//       appBar: AppBar(
//         backgroundColor: kMyColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text(
//           'Select Playing Teams',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0, left: 10.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(3.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes the shadow direction
//                           ),
//                         ]),
//                     width: MediaQuery.of(context).size.width * 0.60,
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     child: const TextField(
//                         decoration: InputDecoration(
//                       hintText: 'Search Team',
//                       prefixIcon: Icon(Icons.search),
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                     )),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0, left: 10.0),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     width: MediaQuery.of(context).size.width * 0.30,
//                     decoration: BoxDecoration(
//                         color: kMyColor,
//                         borderRadius: BorderRadius.circular(3.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes the shadow direction
//                           ),
//                         ]),
//                     child: TextButton(
//                       child: const Text(
//                         'Add Team',
//                         style: TextStyle(color: Colors.black54),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           CupertinoPageRoute(
//                             builder: (context) => const MyTeamScreen(),
//                           ),
//                         );
//                       },
//                     ),
//                     // child: Center(
//                     //     child: Text(
//                     //   'Add Team',
//                     //   style: TextStyle(color: Colors.black54),
//                     // )),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.04,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.10,
//               width: MediaQuery.of(context).size.width * 0.95,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(3.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       spreadRadius: 2,
//                       blurRadius: 7,
//                       offset:
//                           const Offset(0, 3), // changes the shadow direction
//                     ),
//                   ]),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.amber,
//                   maxRadius: 32,
//                   child: Text('JS'),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     CupertinoPageRoute(
//                       builder: (context) => TeamPlayer(),
//                     ),
//                   );
//                 },
//                 title: Text(
//                   'Knight Riders',
//                   style: TextStyle(color: Colors.black, fontSize: 19),
//                 ),
//                 subtitle: Text('C:Rohit Sharma'),
//                 trailing: Icon(
//                   Icons.qr_code_outlined,
//                   size: 25,
//                 ),
//                 titleTextStyle: TextStyle(fontSize: 23.0),
//                 subtitleTextStyle:
//                     TextStyle(fontSize: 15.0, color: Colors.black87),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/AddTeam.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/TeamPage/Team_screen.dart';

class FindTeam extends StatefulWidget {
  const FindTeam({Key? key}) : super(key: key);

  @override
  State<FindTeam> createState() => _FindTeamState();
}

class _FindTeamState extends State<FindTeam> {
  List<dynamic> teams = [];
  bool isLoading = false;
  String errorMessage = '';

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
      //final response = await http.get(Uri.parse('http://127.0.0.1:8000/team/'));
      final response = await http
          .get(Uri.parse('https://cricknightx.pythonanywhere.com/team/'));

      if (response.statusCode == 200) {
        setState(() {
          teams = json.decode(response.body);
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
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Select Playing Teams'),
      ),
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
                      color: kMyColor,
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
                      child: const Text(
                        'Add Team',
                        style: TextStyle(color: Colors.black54),
                      ),
                      onPressed: () {
                        // Implement add team functionality
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CreateTeamPage();
                          },
                        ));
                      },
                    ),
                  ),
                )
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
                      if (team != null && team['Team_name'] != null) {
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
                                  builder: (context) =>
                                      TeamPlayer(teamData: team),
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
