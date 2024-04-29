import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final TextEditingController tCategory;
  const DropDownMenu({super.key, required this.tCategory});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  final List<String> items = [
    'OPEN',
    'CORPORATE',
    'COMMUNITY',
    'SCHOOL',
    'OTHER',
    'SERIES',
    'COLLEGE',
    'UNIVERSITY',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Select Category',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            widget.tCategory.text = value ?? '';
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.60,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
    );
  }
}

class BallTypeDownMenu extends StatefulWidget {
  final TextEditingController ballTypes;
  const BallTypeDownMenu({super.key, required this.ballTypes});

  @override
  State<BallTypeDownMenu> createState() => _BallTypeDownMenu();
}

class _BallTypeDownMenu extends State<BallTypeDownMenu> {
  int selectedBallType = 0; // Default value
  //int selectedPitchType = 0; // Default value

  List<Map<int, String>> ballTypes = [
    {0: 'Select Ball'},
    {1: 'Tennis'},
    {2: 'Leather'},
    {3: 'Others'}
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        hint: Text(
          'Select Ball',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        value: selectedBallType,
        items: ballTypes.map((Map<int, String> ballType) {
          return DropdownMenuItem<int>(
            value: ballType.keys.first,
            child: Text(ballType.values.first),
          );
        }).toList(),
        onChanged: (int? value) {
          setState(() {
            selectedBallType = value!;
            widget.ballTypes.text = value.toString();
          });
          // items: items
          //     .map((String item) => DropdownMenuItem<String>(
          //           value: item,
          //           child: Text(
          //             item,
          //             style: const TextStyle(
          //               fontSize: 14,
          //             ),
          //           ),
          //         ))
          //     .toList(),
          // value: selectedValue,
          // onChanged: (String? value) {
          //   setState(() {
          //     selectedValue = value;
          //   });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.60,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
    );
  }
}

class PitchTypeDownMenu extends StatefulWidget {
  final TextEditingController pitchTypes;
  const PitchTypeDownMenu({super.key, required this.pitchTypes});

  @override
  State<PitchTypeDownMenu> createState() => _PitchTypeDownMenu();
}

class _PitchTypeDownMenu extends State<PitchTypeDownMenu> {
  // Default value
  int selectedPitchType = 0; // Default value

  List<Map<int, String>> pitchTypes = [
    {0: 'Select Pitchs'},
    {1: 'Rough'},
    {2: 'Cement'},
    {3: 'Turf'},
    {4: 'AstroTurf'},
    {5: 'Matting'}
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        hint: Text(
          'Select Pitch',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        value: selectedPitchType,
        items: pitchTypes.map((Map<int, String> pitchType) {
          return DropdownMenuItem<int>(
            value: pitchType.keys.first,
            child: Text(pitchType.values.first),
          );
        }).toList(),
        onChanged: (int? value) {
          setState(() {
            selectedPitchType = value!;
            widget.pitchTypes.text = value.toString();
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.60,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
    );
  }
}
