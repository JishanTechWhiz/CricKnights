import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.85,
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search ",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.mic_outlined)),
      ),
    );
  }
}
