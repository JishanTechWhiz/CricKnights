import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:my_cricket/helpers/constants.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact-Us'),
        backgroundColor: kMyColor,
      ),
      backgroundColor: const Color(0xFFf0fff0),
      //backgroundColor: Colors.teal,
      body: Container(
        margin: EdgeInsets.only(top: 15),
        height: MediaQuery.of(context).size.height * 0.95,
        child: ContactUs(
          logo: AssetImage('assets/images/c1.png'),
          email: 'cricknight18@gmail.com',
          companyName: 'CricKnights',
          phoneNumber: '+91123456789',
          dividerThickness: 2,
          website: 'https://abhishekdoshi.godaddysites.com',
          //githubUserName: 'AbhishekDoshi26',
          //linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
          tagLine: 'Cricket Management',
          instagram: 'Cricknight',
          //twitterHandle: 'AbhishekDoshi26',
          textColor: Colors.white, cardColor: kMyColor,
          companyColor: Colors.black, taglineColor: Colors.black87,
          // instagramUserName: '_abhishek_doshi', textColor: Colors.orangeAccent, cardColor: Colors.black, companyColor: Colors.black, taglineColor: Colors.black,
        ),
      ),
      // bottomNavigationBar: ContactUsBottomAppBar(
      //   companyName: 'Cricknights',
      //   textColor: Colors.white,
      //   backgroundColor: Colors.teal.shade300,
      //   email: 'cricknights18@gmail.com',
      // ),
    );
  }
}
