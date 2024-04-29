import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Component/date_picket.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Component/dropdown_tournament.dart';
import 'package:my_cricket/screens/MyCricket/TabBar/Tab2/Component/myTournament.dart';
import 'package:my_cricket/screens/MyCricket/cricket_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTournament extends StatefulWidget {
  const CreateTournament({super.key});

  @override
  State<CreateTournament> createState() => _CreateTournamentState();
}

class _CreateTournamentState extends State<CreateTournament> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController organizerNameController = TextEditingController();
  final TextEditingController organizerNumController = TextEditingController();
  final TextEditingController organizerEmailController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController groundController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController tournamentCatController = TextEditingController();
  final TextEditingController ballTypeController = TextEditingController();
  final TextEditingController pitchTypeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Map<String, dynamic>> grounds = [];
  List<Map<String, dynamic>> citys = [];

  String selectedGround = '';
  String selectedcity = '';

  @override
  void initState() {
    super.initState();

    fetchGroundData();
    fetchCityData();
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

  Future<void> createTournament() async {
    //final url = Uri.parse('http://127.0.0.1:8000/tournaments/');
    final url =
        Uri.parse('https://cricknightx.pythonanywhere.com/tournaments/');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'tournamentName': nameController.text.trim(),
          'city': int.parse(selectedcity),
          'groundId': int.parse(selectedGround),
          'organizerName': organizerNameController.text.trim(),
          'organizerNum': organizerNumController.text.trim(),
          'organizerEmail': organizerEmailController.text.trim(),
          'startDate': startDateController.text.trim(),
          'endDate': endDateController.text.trim(),
          'tournamentCat': tournamentCatController.text.trim(),
          'ballType': ballTypeController.text.trim(),
          'pitchType': pitchTypeController.text.trim(),
          'description': descriptionController.text.trim(),
        }),
      );
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tournament created successfully')),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Tournament created successfully'),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create tournament')),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Failed to create tournament'),
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
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF06d6a0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Create Tournament',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: teamLogo(context, 'Add Banner'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            tournamentField(context, 'Tournament Name', nameController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //tournamentField(context, 'City', cityController),
            // DropdownButtonFormField<String>(
            //   value: selectedcity,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedcity = newValue!;
            //     });
            //   },
            //   items: citys.map((city) {
            //     return DropdownMenuItem<String>(
            //       value: city['id'].toString(),
            //       child: Text(city['cityName']),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'City'),
            // ),

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
            //tournamentField(context, 'Ground', groundController),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            tournamentField(context, 'Organiser Name', organizerNameController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            tournamentField(
                context, 'Organiser Number', organizerNumController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            tournamentField(
                context, 'Organiser Gmail', organizerEmailController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'Tournament Dates',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.50,
                  // child: tournamentField(
                  //     context, 'Start Date', startDateController),
                  child: DatePicketss(
                    fieldname: 'Start Date',
                    dateController: startDateController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.50,
                  // child:
                  //     tournamentField(context, 'End Date', endDateController),

                  child: DatePicketss(
                    fieldname: 'End Date',
                    dateController: endDateController,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text(
              'Tournament Category',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
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
              child: DropDownMenu(
                tCategory: tournamentCatController,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),
            const Text(
              'Ball Type & Pitch Type',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Row(
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    // child: tournamentField(
                    //     context, 'Ball Type', ballTypeController),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the shadow direction
                          ),
                        ]),
                    child: BallTypeDownMenu(ballTypes: ballTypeController),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.43,
                    // child: tournamentField(
                    //     context, 'Pitch Type', pitchTypeController),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the shadow direction
                          ),
                        ]),
                    child: PitchTypeDownMenu(
                      pitchTypes: pitchTypeController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width * 0.90,
              child: textAreas(descriptionController),
            ),
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
                    createTournament();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CricketScreen()),
                    );
                  },
                  child: const Text(
                    'CREATE',
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
//         onPressed: createTournament,

//         child: const Text(
//           'Next',
//           style: TextStyle(
//               fontSize: 18,
//               //fontWeight: FontWeight.w600,
//               color: Colors.black87),
//         ),
//       ),
//     ),
//   );
//}

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
      ],
    ),
  );
}

Widget tournamentField(BuildContext context, String fieldname,
    TextEditingController textController) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.90,
    height: MediaQuery.of(context).size.width * 0.13,
    child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: fieldname,
          labelStyle: const TextStyle(color: Colors.green, fontSize: 14),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.green,
          )),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              //width: 1.0,
            ),
          ),
        )),
  );
}

TextField textAreas(TextEditingController textarea) {
  //TextEditingController textarea = TextEditingController();
  return TextField(
    controller: textarea,
    keyboardType: TextInputType.multiline,
    maxLines: 4,
    decoration: const InputDecoration(
        hintText: "Add more details like prizes,awards,entry fees,rules, etc.",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            //width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.green))),
  );
}
