// import 'package:flutter/material.dart';
// import 'package:my_cricket/helpers/constants.dart';

// class PlayeForm extends StatelessWidget {
//   final String f1name;
//   final String f2name;
//   const PlayeForm({super.key, required this.f1name, required this.f2name});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.90,
//       height: MediaQuery.of(context).size.height * 0.20,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 7,
//               offset: const Offset(0, 3), // changes the shadow direction
//             ),
//           ]),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                   labelText: f1name,
//                   labelStyle: const TextStyle(color: Colors.black54),
//                   focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(
//                     color: kMyColor,
//                   ))),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                   labelText: f2name,
//                   labelStyle: const TextStyle(color: Colors.black54),
//                   focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(
//                     color: kMyColor,
//                   ))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PlayeForm extends StatelessWidget {
  final String f1name;
  final String f2name;
  final TextEditingController f1Controllers;
  final TextEditingController f2Controllers;
  const PlayeForm(
      {super.key,
      required this.f1name,
      required this.f2name,
      required this.f1Controllers,
      required this.f2Controllers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the shadow direction
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: f1Controllers,
              decoration: InputDecoration(
                  labelText: f1name,
                  labelStyle: const TextStyle(color: Colors.black54),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: f2Controllers,
              decoration: InputDecoration(
                  labelText: f2name,
                  labelStyle: const TextStyle(color: Colors.black54),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
