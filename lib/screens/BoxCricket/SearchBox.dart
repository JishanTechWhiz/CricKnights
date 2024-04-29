import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    offset: const Offset(0, 3), // changes the shadow direction
                  ),
                ]),
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.065,
            child: const TextField(
                decoration: InputDecoration(
              hintText: 'Search Box Ground',
              prefixIcon: Icon(Icons.search),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.065,
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
                color: kMyColor,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes the shadow direction
                  ),
                ]),
            child: TextButton(
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.black54, fontSize: 17),
              ),
              onPressed: () {},
            ),
            // child: Center(
            //     child: Text(
            //   'Add Team',
            //   style: TextStyle(color: Colors.black54),
            // )),
          ),
        )
      ],
    );
  }
}
