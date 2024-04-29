import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:group_button/group_button.dart';
//import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/date_picker.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/match_dropdown.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/match_scorer.dart';

//import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/match_scorer.dart';
//import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/start_innings.dart';

class StartMatchScreen extends StatefulWidget {
  const StartMatchScreen({super.key});

  @override
  State<StartMatchScreen> createState() => _StartMatchScreenState();
}

class _StartMatchScreenState extends State<StartMatchScreen> {
  final TextEditingController matchTypeController = TextEditingController();
  final TextEditingController noOfOversController = TextEditingController();
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();
  final TextEditingController groundController = TextEditingController();

  final TextEditingController overPerBowlerController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController ballTypeController = TextEditingController();
  final TextEditingController pitchTypeController = TextEditingController();

  List<Map<String, dynamic>> teams = [];
  List<Map<String, dynamic>> teams2 = [];
  List<Map<String, dynamic>> grounds = [];
  List<Map<String, dynamic>> citys = [];
  String selectedTeam = '';
  String selectedTeam2 = '';
  String selectedGround = '';
  String selectedcity = '';

  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    fetchTeamData();
    fetchGroundData();
    fetchCityData();
  }

  Future<void> fetchTeamData() async {
    //final response = await http.get(Uri.parse('http://127.0.0.1:8000/team/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/team/'));

    final List<dynamic> data = json.decode(response.body);
    setState(() {
      teams = List<Map<String, dynamic>>.from(data.map((team) {
        return {'id': team['id'], 'Team_name': team['Team_name']};
      }));
      teams2 = List<Map<String, dynamic>>.from(data.map((team2) {
        return {'id': team2['id'], 'Team_name': team2['Team_name']};
      }));
      selectedTeam = (teams.isNotEmpty ? teams[0]['id'].toString() : null)!;
      selectedTeam2 = (teams2.isNotEmpty ? teams2[0]['id'].toString() : null)!;
    });
  }

  Future<void> fetchGroundData() async {
    // final response =
    //     await http.get(Uri.parse('http://127.0.0.1:8000/grounds/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/grounds/'));

    final List<dynamic> data = json.decode(response.body);
    setState(() {
      grounds = List<Map<String, dynamic>>.from(data.map((ground) {
        return {'id': ground['id'], 'groundName': ground['groundName']};
      }));
      selectedGround =
          (grounds.isNotEmpty ? grounds[0]['id'].toString() : null)!;
    });
  }

  Future<void> fetchCityData() async {
    //final response = await http.get(Uri.parse('http://127.0.0.1:8000/cities/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/cities/'));

    final List<dynamic> data = json.decode(response.body);
    setState(() {
      citys = List<Map<String, dynamic>>.from(data.map((city) {
        return {'id': city['id'], 'cityName': city['cityName']};
      }));
      selectedcity = (citys.isNotEmpty ? citys[0]['id'].toString() : null)!;
    });
  }

  Future<http.Response> registerUser(
    BuildContext context, // Add context parameter
    String team1,
    String team2,
    String ground,
    String matchType,
    String noOver,
    String bowOver,
    String city,
    String dateTime,
    String ballType,
    String pitchType,
  ) async {
    //final url = Uri.parse('http://127.0.0.1:8000/matches/');
    final url = Uri.parse('https://cricknightx.pythonanywhere.com/matches/');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId =
        prefs.getInt('userId'); // Retrieve userId from SharedPreferences

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'team_id': int.parse(team1),
        'team_id2': int.parse(team2),
        'ground_id': int.parse(ground),
        'match_type': matchType,
        'noOfOvers': int.parse(noOver),
        'overPerBowler': int.parse(bowOver),
        'city': int.parse(city),
        'dateTime': dateTime,
        'ballType': ballType,
        'pitchType': pitchType,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Successfully Done');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful'),
        ),
      );
      // toastification.show(
      //   showProgressBar: false,
      //   context: context,
      //   title: Text('Registration Successful'),
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
      print('Registration Failed');
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

    return response; // Return the response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      //backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: kMyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Start Match',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            startMatchHeader(context),
            const Text(
              'Match Type',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
              //textAlign: TextAlign.left,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
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
                    'Select Team',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  value: selectedTeam,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTeam = newValue!;
                    });
                  },
                  items: teams.map((team) {
                    return DropdownMenuItem<String>(
                      value: team['id'].toString(),
                      child: Text(team['Team_name']),
                    );
                  }).toList(),
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
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
                    'Select Team2',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  value: selectedTeam2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTeam2 = newValue!;
                    });
                  },
                  items: teams.map((team) {
                    return DropdownMenuItem<String>(
                      value: team['id'].toString(),
                      child: Text(team['Team_name']),
                    );
                  }).toList(),
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
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
              child: DropDownMenu(
                tCategory: matchTypeController,
              ),
            ),
            // categoryGroupBtn(context),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.15,
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   child: MatchType(),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            matchDetailsInput(
                context, noOfOversController, overPerBowlerController),
            //City-Ground---------------
            Container(
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
                    'Select City',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: citys.map((city) {
                    return DropdownMenuItem<String>(
                      value: city['id'].toString(),
                      child: Text(city['cityName']),
                    );
                  }).toList(),
                  value: selectedcity,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedcity = newValue!;
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
            ),
            //Ground
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            Container(
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
                    'Select Ground',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: grounds.map((ground) {
                    return DropdownMenuItem<String>(
                      value: ground['id'].toString(),
                      child: Text(ground['groundName']),
                    );
                  }).toList(),
                  value: selectedGround,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGround = newValue!;
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                _showDateTimePicker(context);
              },
              child: Text('Select Date and Time'),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.15,
            //   width: MediaQuery.of(context).size.width * 0.97,
            //   child: DatePicketss(
            //     fieldname: 'Select Date',
            //     dateTimes: selectedDateTime,
            //   ),
            // ),
            //City-Ground---------
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Ball Type',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
              //textAlign: TextAlign.left,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ballType(context, ballTypeController),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Text(
              'Pitch Type',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
              //textAlign: TextAlign.left,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //pitchType(context),
            // PitchTypeDownMenu(),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
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
              child: PitchTypeDownMenu(
                pitchTypes: pitchTypeController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
                  onPressed: () async {
                    // Navigator.of(context).push(
                    //   CupertinoPageRoute(
                    //     builder: (context) => const MatchScorer(),
                    //   ),
                    // );
                    final String teamz1 = selectedTeam;
                    final String teamz2 = selectedTeam2;
                    final String groundz = selectedGround;
                    final String matchTypez = matchTypeController.text.trim();
                    final String noOverz = noOfOversController.text.trim();
                    final String bowOverz = overPerBowlerController.text.trim();
                    final String cityz = selectedcity;
                    //final String dateTimez = dateTimeController.text.trim();
                    final String dateTimez = selectedDateTime != null
                        ? DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
                            .format(selectedDateTime!)
                        : '';
                    final String battTypez = ballTypeController.text.trim();
                    final String pitchTypez = pitchTypeController.text.trim();

                    final response = await registerUser(
                      context, // Pass the context
                      teamz1,
                      teamz2,
                      groundz,
                      matchTypez,
                      noOverz,
                      bowOverz,
                      cityz,
                      dateTimez,
                      battTypez,
                      pitchTypez,
                    );

                    // Check if registration was successful and proceed
                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      print('Successfully Done');

                      // Parse the response JSON to get the match ID
                      final Map<String, dynamic> responseBody =
                          json.decode(response.body);
                      final int matchId = responseBody['id'];

                      // Navigate to MatchScorer page with the match ID
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => MatchScorer(
                            matchId: matchId,
                          ),
                        ),
                      );
                    } else {
                      print('Registration Failed');
                    }
                  },

                  // registerUser(teamz1, teamz2, groundz, matchTypez, noOverz,
                  //     bowOverz, cityz, dateTimez, battTypez, pitchTypez);

                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) =>
                  //         MatchScorer(matchId: response.body['id']),
                  //   ),
                  // );
                  //},
                  child: const Text(
                    'STARTED MATCH',
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

  Future<void> _showDateTimePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }
}

Widget ballType(BuildContext context, TextEditingController btypeController) {
  return SizedBox(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ballContainer(
              context,
              'assets/icons/ball1.svg',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.06,
            ),
            ballContainer(
              context,
              'assets/icons/ball2.svg',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.06,
            ),
            ballContainer(
              context,
              'assets/icons/ball3.svg',
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        //BallTypeDownMenu(),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes the shadow direction
                ),
              ]),
          child: BallTypeDownMenu(
            ballTypes: btypeController,
          ),
        ),
      ],
    ),
  );
}

Widget matchDetailsInput(BuildContext context,
    TextEditingController noContrller, TextEditingController opbController) {
  return SizedBox(
    //height: MediaQuery.of(context).size.width * 0.20,
    width: MediaQuery.of(context).size.width * 0.90,

    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: noContrller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "No of Overs",
                    hintStyle: TextStyle(color: Colors.black54),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: kMyColor,
                    ))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Expanded(
              child: TextField(
                controller: opbController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Overs per Bowlers",
                    hintStyle: TextStyle(color: Colors.black54),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: kMyColor,
                    ))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    ),
  );
}

Widget ballContainer(BuildContext context, String ballImg) {
  return Container(
    width: 50.0,
    height: 50.0,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      //color: Colors.blue,
    ),
    child: SvgPicture.asset(
      ballImg,
      height: 40,
      width: 40,
    ),
  );
}

Widget startMatchHeader(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.30,
    //width: MediaQuery.of(context).size.width * 0.90,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        teamLogo(context, 'TEAM A'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.07,
        ),
        SvgPicture.asset(
          "assets/icons/war-swords-cross-svgrepo-com.svg",
          height: 40,
          width: 40,
          // ignore: deprecated_member_use
          color: Colors.black,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.07,
        ),
        teamLogo(context, 'TEAM B')
      ],
    ),
  );
}

Widget teamLogo(BuildContext context, String teamname) {
  return SizedBox(
    height: 90,
    width: 90,
    child: Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/1.jpg"),
        ),
        Positioned(
          right: -16,
          bottom: 0,
          child: SizedBox(
            height: 45,
            width: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.white),
                ),
                backgroundColor: const Color(0xFFF5F6F9),
              ),
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
            ),
          ),
        ),
        Positioned(
          top: 95,
          left: 19,
          child: Text(
            teamname,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Positioned(
            top: 126,
            //left: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: kMyColor,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Center(
                  child: Text(
                'Squad (0)',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ))
      ],
    ),
  );
}
