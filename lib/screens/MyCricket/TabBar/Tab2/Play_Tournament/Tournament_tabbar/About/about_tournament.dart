// import 'package:flutter/material.dart';
// import 'package:my_cricket/helpers/constants.dart';

// class AboutTournament extends StatefulWidget {
//   final List<dynamic> tournamentData;
//   const AboutTournament({super.key, required this.tournamentData});

//   @override
//   State<AboutTournament> createState() => _AboutTournamentState();
// }

// class _AboutTournamentState extends State<AboutTournament> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf0fff0),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             Center(
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.22,
//                 width: MediaQuery.of(context).size.width * 0.93,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset:
//                             const Offset(0, 3), // changes the shadow direction
//                       ),
//                     ]),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       width: MediaQuery.of(context).size.width * 0.93,
//                       color: kMyColor,
//                       child: const Center(
//                         child: Text(
//                           'Organiser Details',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircleAvatar(
//                           maxRadius: 40,
//                           child: Icon(
//                             Icons.person_outline,
//                             size: 40,
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.05,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               '${widget.tournamentData['organizerName']}',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black),
//                             ),
//                             Text(
//                               'City: Ahmedabad',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               'Email: rahul123@gmail.com',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.06,
//             ),
//             Center(
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.70,
//                 width: MediaQuery.of(context).size.width * 0.93,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 7,
//                         offset:
//                             const Offset(0, 3), // changes the shadow direction
//                       ),
//                     ]),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.05,
//                       width: MediaQuery.of(context).size.width * 0.93,
//                       color: kMyColor,
//                       child: const Center(
//                         child: Text(
//                           'Tornament Details',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'NAME',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           'Tournament Name',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         const Text(
//                           'DATE',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           '24 Jan,2024 to 31 Jan,2024',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         const Text(
//                           'LOCATIONS',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           'Gujarat College,Ahmedabad',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         const Text(
//                           'BALL TYPE',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           'TENNIS',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         const Text(
//                           'CATEGORY',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           'SCHOOL',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                         const Text(
//                           'TOURNAMENT ID',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Text(
//                           '886355',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.06,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class AboutTournament extends StatefulWidget {
  final List<dynamic>? tournamentData;
  final int? selIndex;

  const AboutTournament({Key? key, this.tournamentData, this.selIndex})
      : super(key: key);

  @override
  State<AboutTournament> createState() => _AboutTournamentState();
}

class _AboutTournamentState extends State<AboutTournament> {
  final List<Map<int, String>> ballTypes = [
    {0: 'Select Ball'},
    {1: 'Tennis'},
    {2: 'Leather'},
    {3: 'Others'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0fff0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 0.93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.93,
                      color: kMyColor,
                      child: const Center(
                        child: Text(
                          'Organiser Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          maxRadius: 40,
                          child: Icon(
                            Icons.person_outline,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Organizer Name:${widget.tournamentData![widget.selIndex!]['organizerName']}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            // Text(
                            //   'City: Ahmedabad',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //   ),
                            // ),
                            Text(
                              'Email: ${widget.tournamentData![widget.selIndex!]['organizerEmail']}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width * 0.93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.93,
                      color: kMyColor,
                      child: const Center(
                        child: Text(
                          'Tournament Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NAME',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          widget.tournamentData![widget.selIndex!]
                              ['tournamentName'],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          'DATE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${widget.tournamentData![widget.selIndex!]['startDate']} to ${widget.tournamentData![widget.selIndex!]['endDate']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          'LOCATIONS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          'Gujarat College,Ahmedabad',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          'BALL TYPE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          //'${ballTypes[int.parse(widget.tournamentData[widget.selIndex]['ballType'])]}',
                          '${ballTypes[int.parse(widget.tournamentData![widget.selIndex!]['ballType'])][int.parse(widget.tournamentData![widget.selIndex!]['ballType'])]}',

                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          'CATEGORY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${widget.tournamentData![widget.selIndex!]['tournamentCat']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          'TOURNAMENT DESCRIPTION',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${widget.tournamentData![widget.selIndex!]['description']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          ],
        ),
      ),
    );
  }
}
