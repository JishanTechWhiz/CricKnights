import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class DropDownMenu extends StatefulWidget {
  final TextEditingController tCategory;
  final String? selectedValue;
  const DropDownMenu({super.key, required this.tCategory, this.selectedValue});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

// Text('Morning Slot: 10:00 AM - 12:00 PM'),
// Text('Mid-Morning Slot: 11:00 AM - 1:00 PM'),
// Text('Afternoon Slot: 1:30 PM - 3:30 PM'),
// Text('Evening Slot: 4:00 PM - 6:00 PM'),
// Text('Night Slot: 6:30 PM - 8:30 PM'),
// Text('Late Night Slot: 9:00 PM - 11:00 PM'),
// Text('Late Night Slot: 12:00 PM - 2:00 PM'),
class _DropDownMenuState extends State<DropDownMenu> {
  final List<String> items = [
    '7:30AM - 9:30AM',
    '10:00AM - 12:00PM',
    '12:30PM - 2:30PM',
    '3:00PM - 5:00PM',
    '5:30PM - 7:30PM',
    '8:00PM - 10:00PM',
    '10:30PM - 12:30AM',
    '1:00AM - 3:00AM',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Time Slot',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
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
      ),
    );
  }
}
