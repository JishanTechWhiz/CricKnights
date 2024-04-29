import 'package:flutter/material.dart';
import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/screens/BoxCricket/BookBoxCric.dart';
import 'package:my_cricket/screens/Home/homepage.dart';

class BoxCricket extends StatelessWidget {
  const BoxCricket({Key? key}) : super(key: key);
  //static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Book Box Cricket',
        ),
        backgroundColor: kMyColor,
      ),
      backgroundColor: const Color(0xFFf0fff0),
      body: const BookBoxCricket(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.search,
      ),
    );
  }
}
