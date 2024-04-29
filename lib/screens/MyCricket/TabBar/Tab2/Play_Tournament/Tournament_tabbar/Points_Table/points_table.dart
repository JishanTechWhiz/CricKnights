import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cricket/helpers/constants.dart';

class PointTable extends StatefulWidget {
  final int tournamentId;
  const PointTable({super.key, required this.tournamentId});

  @override
  State<PointTable> createState() => _PointTableState();
}

class _PointTableState extends State<PointTable> {
  List<Map<String, dynamic>> pointTableData = [];

  @override
  void initState() {
    super.initState();
    fetchPointTableData();
  }

  //'http://127.0.0.1:8000/pointtables/?tournament_id=${widget.tournamentId}'
  Future<void> fetchPointTableData() async {
    try {
      // final response =
      //     await http.get(Uri.parse('http://127.0.0.1:8000/pointtables/'));
      // final response =
      //     await http.get(Uri.parse('http://127.0.0.1:8000/pointtables/'));
      final response = await http.get(
          Uri.parse('https://cricknightx.pythonanywhere.com/pointtables/'));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Check if responseData is a List<dynamic>
        if (responseData is List<dynamic>) {
          setState(() {
            pointTableData = List<Map<String, dynamic>>.from(responseData);
          });
        } else {
          // Handle incorrect response format
          print('Error: Incorrect response format');
          print('Response data type: ${responseData.runtimeType}');
        }
      } else {
        // Handle errors or non-200 status codes
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFf0fff0),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: pointTableData.length,
          itemBuilder: (context, index) {
            //final data = pointTableData[index];
            if (pointTableData[index]['tournamentId'] == widget.tournamentId) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 100,
                    color: Colors.greenAccent.shade100,
                    child: const Center(
                      child: Text(
                        'League Matches',
                        style: TextStyle(
                            fontSize: 15,
                            //fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 100,
                    color: kMyColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Team',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        const Text(
                          'M',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        const Text(
                          'W',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        const Text(
                          'L',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        const Text(
                          'T',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        const Text(
                          'Pt.',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  teamTable(
                      context,
                      pointTableData[index]['teamName1'],
                      pointTableData[index]['matches1'],
                      pointTableData[index]['win1'],
                      pointTableData[index]['loss1'],
                      pointTableData[index]['tie1'],
                      pointTableData[index]['point1']),
                  const Divider(),
                  teamTable(
                      context,
                      pointTableData[index]['teamName2'],
                      pointTableData[index]['matches2'],
                      pointTableData[index]['win2'],
                      pointTableData[index]['loss2'],
                      pointTableData[index]['tie2'],
                      pointTableData[index]['point2']),
                  const Divider(),
                  teamTable(
                      context,
                      pointTableData[index]['teamName3'],
                      pointTableData[index]['matches3'],
                      pointTableData[index]['win3'],
                      pointTableData[index]['loss3'],
                      pointTableData[index]['tie3'],
                      pointTableData[index]['point3']),
                  const Divider(),
                  teamTable(
                      context,
                      pointTableData[index]['teamName4'],
                      pointTableData[index]['matches4'],
                      pointTableData[index]['win4'],
                      pointTableData[index]['loss4'],
                      pointTableData[index]['tie4'],
                      pointTableData[index]['point4']),
                  const Divider(),
                  teamTable(
                      context,
                      pointTableData[index]['teamName5'],
                      pointTableData[index]['matches5'],
                      pointTableData[index]['win5'],
                      pointTableData[index]['loss5'],
                      pointTableData[index]['tie5'],
                      pointTableData[index]['point5']),
                  const Divider(),
                  teamTable(
                      context,
                      pointTableData[index]['teamName6'],
                      pointTableData[index]['matches6'],
                      pointTableData[index]['win6'],
                      pointTableData[index]['loss6'],
                      pointTableData[index]['tie6'],
                      pointTableData[index]['point6']),
                  //const Divider(),
                ],
              );
            } else {
              return Center(
                child: Text(''),
              );
            }
          }),
    );
  }
}

Widget teamTable(BuildContext context, String? teamName, int? match, int? win,
    int? lose, int? tie, int? point) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    width: MediaQuery.of(context).size.width * 100,
    //color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          teamName ?? '',
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        Text(
          '${match ?? 0}',
          style: const TextStyle(fontSize: 17, color: Colors.black87),
        ),
        Text(
          '${win ?? 0}',
          style: const TextStyle(fontSize: 17, color: Colors.black87),
        ),
        Text(
          '${lose ?? 0}',
          style: const TextStyle(fontSize: 17, color: Colors.black87),
        ),
        Text(
          '${tie ?? 0}',
          style: const TextStyle(fontSize: 17, color: Colors.black87),
        ),
        Text(
          '${point ?? 0}',
          style: const TextStyle(fontSize: 17, color: Colors.black87),
        ),
      ],
    ),
  );
}
