import 'package:flutter/material.dart';
import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
import 'package:my_cricket/screens/Profile/profileBody.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  //static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          'Profile',
        ),
      ),
      body: const ProfileBody(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
