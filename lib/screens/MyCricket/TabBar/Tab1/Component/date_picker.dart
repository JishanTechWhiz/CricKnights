// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DatePicketss extends StatefulWidget {
//   final String fieldname;
//   DateTime? dateTimes;

//   DatePicketss({
//     super.key,
//     required this.fieldname,
//     required this.dateTimes,
//   });
//   @override
//   State<StatefulWidget> createState() {
//     return _DatePicketss();
//   }
// }

// class _DatePicketss extends State<DatePicketss> {
//   TextEditingController dateInput = TextEditingController();
//   DateTime? selectedDateTime;

//   @override
//   void initState() {
//     dateInput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(15),
//         height: MediaQuery.of(context).size.width / 3,
//         child: Center(
//             child: TextField(
//           controller: dateInput,
//           //editing controller of this TextField
//           decoration: InputDecoration(
//               icon: const Icon(Icons.calendar_today), //icon of text field
//               labelText: widget.fieldname //label text of field
//               ),
//           readOnly: true,
//           //set it true, so that user will not able to edit text
//           onTap: () async {
//             /*DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(1950),
//                 //DateTime.now() - not to allow to choose before today.
//                 lastDate: DateTime(2100));

//             if (pickedDate != null) {
//               print(
//                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//               String formattedDate =
//                   DateFormat('yyyy-MM-dd').format(pickedDate);
//               print(
//                   formattedDate); //formatted date output using intl package =>  2021-03-16
//               setState(() {
//                 dateInput.text =
//                     formattedDate; //set output date to TextField value.
//               });
//             } else {}*/
//             final pickedDate = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2101),
//             );

//             if (pickedDate != null) {
//               final pickedTime = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//               );

//               if (pickedTime != null) {
//                 setState(() {
//                   widget.dateTimes = DateTime(
//                     pickedDate.year,
//                     pickedDate.month,
//                     pickedDate.day,
//                     pickedTime.hour,
//                     pickedTime.minute,
//                   );
//                 });
//                 print(widget.dateTimes);
//               }
//             }
//           },
//         )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePicketss extends StatefulWidget {
  final String fieldname;
  DateTime? dateTimes;

  DatePicketss({
    Key? key,
    required this.fieldname,
    required this.dateTimes,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DatePicketssState();
  }
}

class _DatePicketssState extends State<DatePicketss> {
  TextEditingController dateInput = TextEditingController();
  DateTime? selectedDateTime;

  @override
  void initState() {
    if (widget.dateTimes != null) {
      dateInput.text = DateFormat('yyyy-MM-dd HH:mm').format(widget.dateTimes!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.width / 3,
      child: Center(
        child: TextField(
          controller: dateInput,
          decoration: InputDecoration(
            icon: const Icon(Icons.calendar_today),
            labelText: widget.fieldname,
          ),
          readOnly: true,
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                setState(() {
                  selectedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                  dateInput.text =
                      DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime!);
                });
                print(selectedDateTime);
              }
            }
          },
        ),
      ),
    );
  }
}
