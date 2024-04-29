import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
// import 'package:my_cricket/helpers/constants.dart';

class PointForm extends StatelessWidget {
  final String teanName;
  final String matches;
  final String points;
  final String win;
  final String loss;
  final String tie;

  final TextEditingController teamControllers;
  final TextEditingController matchControllers;
  final TextEditingController pointControllers;
  final TextEditingController winControllers;
  final TextEditingController lossControllers;
  final TextEditingController tieControllers;

  const PointForm({
    super.key,
    required this.teanName,
    required this.matches,
    required this.points,
    required this.win,
    required this.loss,
    required this.tie,
    required this.teamControllers,
    required this.matchControllers,
    required this.pointControllers,
    required this.winControllers,
    required this.lossControllers,
    required this.tieControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.30,
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
              controller: teamControllers,
              decoration: InputDecoration(
                  labelText: teanName,
                  labelStyle: const TextStyle(color: Colors.black54),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: kMyColor,
                  ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: matchControllers,
                      decoration: InputDecoration(
                          labelText: matches,
                          labelStyle: const TextStyle(color: Colors.black54),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: kMyColor,
                          ))),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: TextField(
                    controller: pointControllers,
                    decoration: InputDecoration(
                        labelText: points,
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: kMyColor,
                        ))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: winControllers,
                      decoration: InputDecoration(
                          labelText: win,
                          labelStyle: const TextStyle(color: Colors.black54),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: kMyColor,
                          ))),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: TextField(
                    controller: lossControllers,
                    decoration: InputDecoration(
                        labelText: loss,
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: kMyColor,
                        ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: TextField(
                    controller: tieControllers,
                    decoration: InputDecoration(
                        labelText: tie,
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: kMyColor,
                        ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
