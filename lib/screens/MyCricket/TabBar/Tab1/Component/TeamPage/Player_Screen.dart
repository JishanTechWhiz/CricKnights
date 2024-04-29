import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class Players extends StatelessWidget {
  final String name;
  final String role;
  const Players({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes the shadow direction
              ),
            ]),
        child: ListTile(
          leading: CircleAvatar(
            //backgroundImage: AssetImage('assets/image/c3.png'),
            backgroundColor: Colors.white,
            maxRadius: 32,
            child: Image.asset(
              'assets/images/c2.png',
              fit: BoxFit.cover,
              width: 55,
            ),
            //child: Text('JS'),
          ),
          //onTap: () {},
          title: Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
          subtitle: Text(role),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: kMyColor,
          ),

          titleTextStyle: TextStyle(fontSize: 23.0),
          subtitleTextStyle: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ),
    );
  }
}
