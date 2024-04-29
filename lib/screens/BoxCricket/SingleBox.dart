import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/screens/BoxCricket/bookData.dart';
import 'package:my_cricket/screens/BoxCricket/book_dropdown.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  final int boxId;
  final String img;
  final String address;
  final String number;
  final String rating;
  final String gName;
  final int gPrice;

  DetailPage({
    required this.img,
    required this.address,
    required this.number,
    required this.rating,
    required this.gName,
    required this.gPrice,
    required this.boxId,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeSlotController =
      TextEditingController(); // Text controller for time slot
  TextEditingController groundIdController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? dropdownValue;

  String availabilityMessage = '';
  //int? bookingId;

  Future<void> checkAvailability() async {
    final response = await http.post(
      // Uri.parse('http://localhost:8000/check-time-slot-availability/'),
      Uri.parse(
          'https://cricknightx.pythonanywhere.com/check-time-slot-availability/'),
      body: jsonEncode({
        'date': dateController.text,
        'time_slot': timeSlotController.text, // Use timeSlotController's text
        'ground_id': widget.boxId,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        availabilityMessage = data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text(data['message']),
        //   type: ToastificationType.info,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 2),
        //   icon: const Icon(
        //     Icons.info_outline,
        //     color: Colors.blue,
        //   ),
        // );
      });
    } else {
      setState(() {
        availabilityMessage = 'Error: ${response.statusCode}';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')),
        );
        // toastification.show(
        //   showProgressBar: false,
        //   context: context,
        //   title: Text('Error: ${response.statusCode}'),
        //   type: ToastificationType.error,
        //   style: ToastificationStyle.minimal,
        //   alignment: Alignment.bottomCenter,
        //   autoCloseDuration: Duration(seconds: 2),
        //   icon: Icon(
        //     Icons.error,
        //     color: Colors.red,
        //   ),
        // );
      });
    }
  }

  Future<void> bookGround() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    final response = await http.post(
      //Uri.parse('http://localhost:8000/book-ground/'),
      Uri.parse('https://cricknightx.pythonanywhere.com/book-ground/'),
      body: jsonEncode({
        'user_id': userId, // Example user ID
        'date': dateController.text,
        'time_slot': timeSlotController.text, // Use timeSlotController's text
        'ground_id': widget.boxId,
        'price': widget.gPrice,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        dateController.text = '';
        //bookingId = data['booking_id'];
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Booking Successful'),
            content: Text('Booking ID: ${data['booking_id']}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to book ground'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  //image: AssetImage("assets/images/Box/b2.jpeg"),
                  image: NetworkImage(
                    widget.img,
                  ),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/Back ICon.svg",
                          height: 20,
                          width: 20,
                        )),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          // ignore: deprecated_member_use
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return BookingDetailsPage();
                                },
                              ));
                            },
                            icon: Icon(
                              Icons.receipt_long,
                              color: Colors.red,
                              weight: 50,
                            )),
                        // InkWell(
                        //     onTap: () {},
                        //     child:
                        //         SvgPicture.asset("assets/icons/receipt.svg")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13),
                    child: Text(
                      //"10 best interior ideas for your\nliving room",
                      widget.gName,
                      style: const TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          color: kMyColor),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Star Icon.svg",
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          widget.rating + '/5',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.6),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.img,
                                ),
                                //image: AssetImage("assets/images/Box/b2.jpeg"),
                                //image: NetworkImage(
                                //"https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.gName,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Box Cricket Ground",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   //"Super Box Cricket: A dynamic fusion of speed, skill, and strategy! Our cutting-edge facility boasts state-of-the-art synthetic turf, precision-designed boundaries, and immersive lighting. Experience the thrill of indoor cricket like never before.Whether you're a seasoned pro or a rookie enthusiast, step into our arena and unleash your cricketing prowess!",
                  //   "${widget.gName}: Elevate your game in our premier indoor arena. With advanced turf, defined boundaries, and dynamic lighting, immerse yourself in the thrill of cricket like never before. Unleash your skills today!",
                  //   style: const TextStyle(height: 1.6),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    'Address: ${widget.address}',
                    style: const TextStyle(height: 1.6),
                  ),
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 22,
                              color: kMyColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              widget.number,
                              style: const TextStyle(height: 1.6),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'the price would be ${widget.gPrice}/-. This rate applies to all slots',
                          style: const TextStyle(height: 1.6),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Morning Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 7:30 AM - 9:30 AM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Mid-Morning Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 10:00 AM - 12:00 PM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Afternoon Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 12:30 PM - 2:30 PM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Mid-Afternoon Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 3:00 PM - 5:00 PM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Evening Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 5:30 PM - 7:30 PM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Night Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 8:00 PM - 10:00 PM')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Late-Night Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 10:30 PM - 12:30 AM ')
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Late-Night Slot:',
                                  style: TextStyle(color: kMyColor),
                                ),
                                Text(' 1:00 AM - 3:00 AM ')
                              ],
                            ),
                            // Text('Morning Slot: 10:00 AM - 12:00 PM'),
                            // Text('Mid-Morning Slot: 11:00 AM - 1:00 PM'),
                            // Text('Afternoon Slot: 1:30 PM - 3:30 PM'),
                            // Text('Evening Slot: 4:00 PM - 6:00 PM'),
                            // Text('Night Slot: 6:30 PM - 8:30 PM'),
                            // Text('Late Night Slot: 9:00 PM - 11:00 PM'),
                            // Text('Late Night Slot: 12:00 PM - 2:00 PM'),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropDownMenu(
                          tCategory: timeSlotController,
                          selectedValue: dropdownValue,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            controller: dateController,
                            readOnly: true,
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null && picked != DateTime.now())
                                setState(() {
                                  dateController.text =
                                      picked.toString().split(' ')[0];
                                });
                            },
                            decoration:
                                InputDecoration(labelText: 'Select Book Date'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            checkAvailability();
                          },
                          child: Text('Check Availability'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              bookGround();
                              setState(() {
                                dropdownValue = null;
                              });
                              // Navigator.of(context).push(
                              //     CupertinoPageRoute(
                              //       builder: (context) => const StartInnings(),
                              //     ),
                              //   );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: kMyColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  "Book",
                                  style: TextStyle(
                                      fontSize: 18,
                                      //fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
