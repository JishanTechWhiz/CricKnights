import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/Tournament_tabbar/Points_Table/pointTable_form.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Play_Tournament/single_tournament.dart';

class PointTableForm extends StatefulWidget {
  final int tournamentId;
  const PointTableForm({Key? key, required this.tournamentId})
      : super(key: key);

  @override
  State<PointTableForm> createState() => _PointTableFormState();
}

class _PointTableFormState extends State<PointTableForm> {
  //static String routeName = "/profile";
  final TextEditingController tournamentIdController2 = TextEditingController();
  //Team1
  final TextEditingController tournamentIdController = TextEditingController();
  final TextEditingController teamName1Controller = TextEditingController();
  final TextEditingController matches1Controller = TextEditingController();
  final TextEditingController win1Controller = TextEditingController();
  final TextEditingController loss1Controller = TextEditingController();
  final TextEditingController tie1Controller = TextEditingController();
  final TextEditingController point1Controller = TextEditingController();
  //Team2
  final TextEditingController teamName2Controller = TextEditingController();
  final TextEditingController matches2Controller = TextEditingController();
  final TextEditingController win2Controller = TextEditingController();
  final TextEditingController loss2Controller = TextEditingController();
  final TextEditingController tie2Controller = TextEditingController();
  final TextEditingController point2Controller = TextEditingController();
  //Team3
  final TextEditingController teamName3Controller = TextEditingController();
  final TextEditingController matches3Controller = TextEditingController();
  final TextEditingController win3Controller = TextEditingController();
  final TextEditingController loss3Controller = TextEditingController();
  final TextEditingController tie3Controller = TextEditingController();
  final TextEditingController point3Controller = TextEditingController();
  //Team4
  final TextEditingController teamName4Controller = TextEditingController();
  final TextEditingController matches4Controller = TextEditingController();
  final TextEditingController win4Controller = TextEditingController();
  final TextEditingController loss4Controller = TextEditingController();
  final TextEditingController tie4Controller = TextEditingController();
  final TextEditingController point4Controller = TextEditingController();
  //Team5
  final TextEditingController teamName5Controller = TextEditingController();
  final TextEditingController matches5Controller = TextEditingController();
  final TextEditingController win5Controller = TextEditingController();
  final TextEditingController loss5Controller = TextEditingController();
  final TextEditingController tie5Controller = TextEditingController();
  final TextEditingController point5Controller = TextEditingController();
  //Team6
  final TextEditingController teamName6Controller = TextEditingController();
  final TextEditingController matches6Controller = TextEditingController();
  final TextEditingController win6Controller = TextEditingController();
  final TextEditingController loss6Controller = TextEditingController();
  final TextEditingController tie6Controller = TextEditingController();
  final TextEditingController point6Controller = TextEditingController();

  List<Map<String, dynamic>> tournaments = [];
  String selectedTournament = '';

  @override
  void initState() {
    super.initState();
    fetchTournamentData();
  }

  Future<void> fetchTournamentData() async {
    // final response =
    //     await http.get(Uri.parse('http://127.0.0.1:8000/tournaments/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/tournaments/'));
    final List<dynamic> data = json.decode(response.body);
    setState(() {
      tournaments = List<Map<String, dynamic>>.from(data.map((point) {
        return {'id': point['id'], 'tournamentName': point['tournamentName']};
      }));
      selectedTournament =
          (tournaments.isNotEmpty ? tournaments[0]['id'].toString() : null)!;
      if (tournaments.isNotEmpty) {
        tournamentIdController2.text = widget.tournamentId.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Point Table',
        ),
        backgroundColor: kMyColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),

            // TextField(
            //   controller: tournamentIdController2,
            //   readOnly: true,
            // )
            // ,
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.width * 0.13,
                child: TextField(
                    readOnly: true,
                    controller: tournamentIdController2,
                    decoration: InputDecoration(
                      labelText: 'Tournament ID',
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
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),

            /*Container(
              //height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.90,
              // child:
              //     tournamentField(context, 'Category', tournamentCatController),

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset:
                          const Offset(0, 3), // changes the shadow direction
                    ),
                  ]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Category',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: tournaments.map((point) {
                    return DropdownMenuItem<String>(
                      value: point['id'].toString(),
                      child: Text(point['tournamentName']),
                    );
                  }).toList(),
                  value: selectedTournament,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTournament = newValue!;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.60,
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
              ),
            ),*/

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(1)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName1Controller,
                matchControllers: matches1Controller,
                pointControllers: point1Controller,
                winControllers: win1Controller,
                lossControllers: loss1Controller,
                tieControllers: tie1Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(2)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName2Controller,
                matchControllers: matches2Controller,
                pointControllers: point2Controller,
                winControllers: win2Controller,
                lossControllers: loss2Controller,
                tieControllers: tie2Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(3)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName3Controller,
                matchControllers: matches3Controller,
                pointControllers: point3Controller,
                winControllers: win3Controller,
                lossControllers: loss3Controller,
                tieControllers: tie3Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(4)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName4Controller,
                matchControllers: matches4Controller,
                pointControllers: point4Controller,
                winControllers: win4Controller,
                lossControllers: loss4Controller,
                tieControllers: tie4Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(5)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName5Controller,
                matchControllers: matches5Controller,
                pointControllers: point5Controller,
                winControllers: win5Controller,
                lossControllers: loss5Controller,
                tieControllers: tie5Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: PointForm(
                teanName: 'Team Name(6)',
                matches: 'Matches',
                points: 'Points',
                win: 'Win',
                loss: 'Loss',
                tie: 'Tie',
                teamControllers: teamName6Controller,
                matchControllers: matches6Controller,
                pointControllers: point6Controller,
                winControllers: win6Controller,
                lossControllers: loss6Controller,
                tieControllers: tie6Controller,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //myBtn(context),
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
                    // Navigator.of(context).push(
                    //   CupertinoPageRoute(
                    //     builder: (context) => const StartMatchScreen(),
                    //   ),
                    // );
                    //1
                    final String tournamentIdz =
                        tournamentIdController2.text.trim();
                    final String teamName1 = teamName1Controller.text.trim();
                    final String matches1 = matches1Controller.text.trim();
                    final String win1 = win1Controller.text.trim();
                    final String loss1 = loss1Controller.text.trim();
                    final String tie1 = tie1Controller.text.trim();
                    final String point1 = point1Controller.text.trim();
                    //2
                    final String teamName2 = teamName2Controller.text.trim();
                    final String matches2 = matches2Controller.text.trim();
                    final String win2 = win2Controller.text.trim();
                    final String loss2 = loss2Controller.text.trim();
                    final String tie2 = tie2Controller.text.trim();
                    final String point2 = point2Controller.text.trim();
                    // Get values from other text controllers similarly
                    //3
                    final String teamName3 = teamName3Controller.text.trim();
                    final String matches3 = matches3Controller.text.trim();
                    final String win3 = win3Controller.text.trim();
                    final String loss3 = loss3Controller.text.trim();
                    final String tie3 = tie3Controller.text.trim();
                    final String point3 = point3Controller.text.trim();
                    //4
                    final String teamName4 = teamName4Controller.text.trim();
                    final String matches4 = matches4Controller.text.trim();
                    final String win4 = win4Controller.text.trim();
                    final String loss4 = loss4Controller.text.trim();
                    final String tie4 = tie4Controller.text.trim();
                    final String point4 = point4Controller.text.trim();
                    //5
                    final String teamName5 = teamName5Controller.text.trim();
                    final String matches5 = matches5Controller.text.trim();
                    final String win5 = win5Controller.text.trim();
                    final String loss5 = loss5Controller.text.trim();
                    final String tie5 = tie5Controller.text.trim();
                    final String point5 = point5Controller.text.trim();
                    //6
                    final String teamName6 = teamName6Controller.text.trim();
                    final String matches6 = matches6Controller.text.trim();
                    final String win6 = win6Controller.text.trim();
                    final String loss6 = loss6Controller.text.trim();
                    final String tie6 = tie6Controller.text.trim();
                    final String point6 = point6Controller.text.trim();

                    registerTournamentPointTable(
                      tournamentIdz,
                      teamName1,
                      matches1,
                      win1,
                      loss1,
                      tie1,
                      point1,
                      //2
                      teamName2,
                      matches2,
                      win2,
                      loss2,
                      tie2,
                      point2,
                      //3
                      teamName3,
                      matches3,
                      win3,
                      loss3,
                      tie3,
                      point3,
                      //4
                      teamName4,
                      matches4,
                      win4,
                      loss4,
                      tie4,
                      point4,
                      //5
                      teamName5,
                      matches5,
                      win5,
                      loss5,
                      tie5,
                      point5,
                      //6
                      teamName6,
                      matches6,
                      win6,
                      loss6,
                      tie6,
                      point6,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SingleTournament()),
                    // );
                  },
                  child: const Text(
                    'Submit Result',
                    style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerTournamentPointTable(
    //1
    String tournamentIdz,
    String teamName1,
    String matches1,
    String win1,
    String loss1,
    String tie1,
    String point1,
    //2
    String teamName2,
    String matches2,
    String win2,
    String loss2,
    String tie2,
    String point2,
    //3
    String teamName3,
    String matches3,
    String win3,
    String loss3,
    String tie3,
    String point3,
    //4
    String teamName4,
    String matches4,
    String win4,
    String loss4,
    String tie4,
    String point4,
    //5
    String teamName5,
    String matches5,
    String win5,
    String loss5,
    String tie5,
    String point5,
    //6
    String teamName6,
    String matches6,
    String win6,
    String loss6,
    String tie6,
    String point6,
    // Add parameters for other fields similarly
  ) async {
    //final url = Uri.parse('http://127.0.0.1:8000/pointtables/');
    final url =
        Uri.parse('https://cricknightx.pythonanywhere.com/pointtables/');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        //1
        'tournamentId': int.parse(tournamentIdz),
        'teamName1': teamName1,
        'matches1': int.parse(matches1),
        'win1': int.parse(win1),
        'loss1': int.parse(loss1),
        'tie1': int.parse(tie1),
        'point1': int.parse(point1),
        //2
        'teamName2': teamName2,
        'matches2': int.parse(matches2),
        'win2': int.parse(win2),
        'loss2': int.parse(loss2),
        'tie2': int.parse(tie2),
        'point2': int.parse(point2),
        //3
        'teamName3': teamName3,
        'matches3': int.parse(matches3),
        'win3': int.parse(win3),
        'loss3': int.parse(loss3),
        'tie3': int.parse(tie3),
        'point3': int.parse(point3),
        //4
        'teamName4': teamName4,
        'matches4': int.parse(matches4),
        'win4': int.parse(win4),
        'loss4': int.parse(loss4),
        'tie4': int.parse(tie4),
        'point4': int.parse(point4),
        //5
        'teamName5': teamName5,
        'matches5': int.parse(matches5),
        'win5': int.parse(win5),
        'loss5': int.parse(loss5),
        'tie5': int.parse(tie5),
        'point5': int.parse(point5),
        //6
        'teamName6': teamName6,
        'matches6': int.parse(matches6),
        'win6': int.parse(win6),
        'loss6': int.parse(loss6),
        'tie6': int.parse(tie6),
        'point6': int.parse(point6),
        // Add other fields similarly
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Tournament Point Table registered successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Pointtable registered successfully'),
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
      print('Failed to register Tournament Point Table');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Failed'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Registration Failed'),
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
//           // Navigator.of(context).push(
//           //   CupertinoPageRoute(
//           //     builder: (context) => const StartMatchScreen(),
//           //   ),
//           // );
//         },
//         child: const Text(
//           'Submit Result',
//           style: TextStyle(
//               fontSize: 18,
//               //fontWeight: FontWeight.w600,
//               color: Colors.black87),
//         ),
//       ),
//     ),
//   );
// }
