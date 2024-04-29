import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/screens/Home/Compo/search_field.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
        ],
      ),
    );
  }
}
