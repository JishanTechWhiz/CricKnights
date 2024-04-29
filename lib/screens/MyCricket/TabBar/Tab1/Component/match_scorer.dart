import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/cricket_screen.dart';

class MatchScorer extends StatefulWidget {
  final int matchId;
  MatchScorer({super.key, required this.matchId});

  @override
  State<MatchScorer> createState() => _MatchScorerState();
}

class _MatchScorerState extends State<MatchScorer> {
  final TextEditingController matchTypeController = TextEditingController();

  final TextEditingController tossWinController = TextEditingController();
  final TextEditingController battingTeamController = TextEditingController();
  final TextEditingController bowlingTeamController = TextEditingController();
  final TextEditingController firstInningsRunsController =
      TextEditingController();
  final TextEditingController firstInningsFoursController =
      TextEditingController();
  final TextEditingController firstInningsSixesController =
      TextEditingController();
  final TextEditingController firstInningsWicketsController =
      TextEditingController();
  final TextEditingController secondInningsRunsController =
      TextEditingController();
  final TextEditingController secondInningsFoursController =
      TextEditingController();
  final TextEditingController secondInningsSixesController =
      TextEditingController();
  final TextEditingController secondInningsWicketsController =
      TextEditingController();
  final TextEditingController winnerTeamController = TextEditingController();
  List<Map<String, dynamic>> matchTypes = [];
  String selectedMatchType = '';

  @override
  void initState() {
    super.initState();
    matchTypeController.text = widget.matchId.toString();
    fetchMatchData();
  }

  Future<void> fetchMatchData() async {
    // final response =
    //     await http.get(Uri.parse('http://127.0.0.1:8000/matches/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/matches/'));
    final List<dynamic> data = json.decode(response.body);
    setState(() {
      matchTypes = List<Map<String, dynamic>>.from(data.map((match) {
        return {'id': match['id'], 'match_type': match['match_type']};
      }));
      selectedMatchType =
          (matchTypes.isNotEmpty ? matchTypes[0]['id'].toString() : null)!;
    });
  }

  Future<void> registerMatchScorerDetail(
      String matchType,
      String tossWin,
      String batTeam,
      String bowTeam,
      String firstRun,
      String firstFour,
      String firstSix,
      String firstWicket,
      String secondRun,
      String secondFour,
      String secondSix,
      String secondWicket,
      String winTeam) async {
    //final url = Uri.parse('http://127.0.0.1:8000/scorerdetails/');
    final url =
        Uri.parse('https://cricknightx.pythonanywhere.com/scorerdetails/');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'tossWin': tossWin,
        'battingTeam': batTeam,
        'bowlingTeam': bowTeam,
        'firstInnings_totalRuns': int.parse(firstRun),
        'firstInnings_totalFours': int.parse(firstFour),
        'firstInnings_totalSixs': int.parse(firstSix),
        'firstInnings_totalWicket': int.parse(firstWicket),
        'secondInnings_totalRuns': int.parse(secondRun),
        'secondInnings_totalFours': int.parse(secondFour),
        'secondInnings_totalSixs': int.parse(secondSix),
        'secondInnings_totalWicket': int.parse(secondWicket),
        'winnerTeam': winTeam,
        'matchId': int.parse(matchType),
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Match scorer detail registered successfully');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Scorer registered successfully'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Scorer registered successfully'),
      //   type: ToastificationType.success,
      //   style: ToastificationStyle.minimal,
      //   alignment: Alignment.bottomCenter,
      //   autoCloseDuration: Duration(seconds: 2),
      //   icon: const Icon(
      //     Icons.check_circle_outline_outlined,
      //     color: Colors.green,
      //   ),
      // );
    } else {
      print('Failed to register match scorer detail');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to register scorer detail'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Failed to register scorer detail'),
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
      backgroundColor: const Color(0xFFf0fff0),
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Match Scorer',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                    controller: matchTypeController,
                    decoration: InputDecoration(
                      labelText: 'Match ID',
                      labelStyle:
                          const TextStyle(color: kMyColor, fontSize: 14),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kMyColor,
                      )),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                          //width: 1.0,
                        ),
                      ),
                    )),
              ),
            ),
            // Container(
            //   //height: MediaQuery.of(context).size.height * 0.15,
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   // child:
            //   //     tournamentField(context, 'Category', tournamentCatController),

            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(4.0),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black.withOpacity(0.1),
            //           spreadRadius: 1,
            //           blurRadius: 5,
            //           offset:
            //               const Offset(0, 3), // changes the shadow direction
            //         ),
            //       ]),
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton2<String>(
            //       isExpanded: true,
            //       hint: Text(
            //         'Select Category',
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Theme.of(context).hintColor,
            //         ),
            //       ),
            //       items: matchTypes.map((match) {
            //         return DropdownMenuItem<String>(
            //           value: match['id'].toString(),
            //           child: Text(match['id'].toString()),
            //           //child: Text(match['match_type']),
            //         );
            //       }).toList(),
            //       value: selectedMatchType,
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           selectedMatchType = newValue!;
            //         });
            //       },
            //       buttonStyleData: ButtonStyleData(
            //         padding: const EdgeInsets.symmetric(horizontal: 16),
            //         height: MediaQuery.of(context).size.height * 0.07,
            //         width: MediaQuery.of(context).size.width * 0.60,
            //       ),
            //       menuItemStyleData: MenuItemStyleData(
            //         height: MediaQuery.of(context).size.height * 0.07,
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            tournamentField(context, 'Toss Win Team', tossWinController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentField(
                        context, 'Batting Team', battingTeamController)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentField(
                        context, 'Bowling Team', bowlingTeamController)),
              ],
            ),
            const Text(
              'Total Run Score',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(
                        context, 'First Innings', firstInningsRunsController)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(context, 'Second Innings ',
                        secondInningsRunsController)),
              ],
            ),
            const Text(
              'Total Fours',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(
                        context, 'First Innings', firstInningsFoursController)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(context, 'Second Innings ',
                        secondInningsFoursController)),
              ],
            ),
            const Text(
              'Total Sixs',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(
                        context, 'First Innings', firstInningsSixesController)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(context, 'Second Innings',
                        secondInningsSixesController)),
              ],
            ),
            const Text(
              'Total Wickets',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(context, 'First Innings',
                        firstInningsWicketsController)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: tournamentNumberField(context, 'Second Innings',
                        secondInningsWicketsController)),
              ],
            ),
            tournamentField(context, 'Win Team', winnerTeamController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // myBtn(context),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CricketScreen()),
                    // );
                    final String matchTypez = matchTypeController.text.trim();
                    final String tossWinz = tossWinController.text.trim();
                    final String batTeamz = battingTeamController.text.trim();

                    final String bowTeamz = bowlingTeamController.text.trim();
                    final String firstRunz =
                        firstInningsRunsController.text.trim();
                    final String firstFourz =
                        firstInningsFoursController.text.trim();
                    final String firstSixz =
                        firstInningsSixesController.text.trim();
                    final String firstWicketz =
                        firstInningsSixesController.text.trim();
                    final String secondRunz =
                        secondInningsRunsController.text.trim();
                    final String secondFourz =
                        secondInningsFoursController.text.trim();
                    final String secondSixz =
                        secondInningsSixesController.text.trim();
                    final String secondWicketz =
                        secondInningsWicketsController.text.trim();
                    final String winTeamz = winnerTeamController.text.trim();

                    registerMatchScorerDetail(
                        matchTypez,
                        tossWinz,
                        batTeamz,
                        bowTeamz,
                        firstRunz,
                        firstFourz,
                        firstSixz,
                        firstWicketz,
                        secondRunz,
                        secondFourz,
                        secondSixz,
                        secondWicketz,
                        winTeamz);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CricketScreen()),
                    );
                  },
                  child: const Text(
                    'Complete Match',
                    style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget myBtn(BuildContext context) {
//   return SizedBox(
//     child: Container(
//       height: MediaQuery.of(context).size.height * 0.07,
//       width: MediaQuery.of(context).size.width * 0.85,
//       decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: kMyColor,
//           borderRadius: BorderRadius.circular(5)),
//       child: TextButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CricketScreen()),
//           );
//         },
//         child: const Text(
//           'Complete Match',
//           style: TextStyle(
//               fontSize: 18,
//               //fontWeight: FontWeight.w600,
//               color: Colors.black87),
//         ),
//       ),
//     ),
//   );
// }

Widget tournamentField(BuildContext context, String fieldname,
    TextEditingController textControllers) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.width * 0.13,
      child: TextField(
          controller: textControllers,
          decoration: InputDecoration(
            labelText: fieldname,
            labelStyle: const TextStyle(color: kMyColor, fontSize: 14),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: kMyColor,
            )),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
                //width: 1.0,
              ),
            ),
          )),
    ),
  );
}

Widget tournamentNumberField(BuildContext context, String fieldname,
    TextEditingController numberControllers) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.width * 0.13,
      child: TextField(
          controller: numberControllers,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: fieldname,
            labelStyle: const TextStyle(color: kMyColor, fontSize: 14),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: kMyColor,
            )),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
                //width: 1.0,
              ),
            ),
          )),
    ),
  );
}
