import 'package:flutter/material.dart';
import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Profile/profile_input.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);
  //static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: kMyColor,
          ),
        ),
        title: const Text(
          'Profile',
        ),
      ),
      body: ProfileInput(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
