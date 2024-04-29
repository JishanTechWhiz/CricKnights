// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:my_cricket/helpers/constants.dart';
// import 'package:my_cricket/screens/MyCricket/TabBar/Tab1/Component/Player_form.dart';

// class TeamForm extends StatelessWidget {
//   const TeamForm({super.key});

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
//           'Select Team',
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             Center(
//               child: teamLogo(),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             const Center(
//               child: Text(
//                 'Team Logo',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),

//             const PlayeForm(f1name: 'Team Name', f2name: 'Captain Name'),

//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             const PlayeForm(f1name: 'Player Name', f2name: 'Player Role'),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),

//             myBtn(context),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.07,
//             ),
//             //const Spacer()
//           ],
//         ),
//       ),
//     );
//   }
// }

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
//           'Create Team',
//           style: TextStyle(
//               fontSize: 18,
//               //fontWeight: FontWeight.w600,
//               color: Colors.black87),
//         ),
//       ),
//     ),
//   );
// }

// Widget teamLogo() {
//   return SizedBox(
//     height: 100,
//     width: 100,
//     child: Stack(
//       fit: StackFit.expand,
//       clipBehavior: Clip.none,
//       children: [
//         const CircleAvatar(
//           backgroundImage: AssetImage("assets/images/1.jpg"),
//         ),
//         Positioned(
//           right: -16,
//           bottom: 0,
//           child: SizedBox(
//             height: 46,
//             width: 46,
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   side: const BorderSide(color: Colors.white),
//                 ),
//                 backgroundColor: const Color(0xFFF5F6F9),
//               ),
//               onPressed: () {},
//               child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
