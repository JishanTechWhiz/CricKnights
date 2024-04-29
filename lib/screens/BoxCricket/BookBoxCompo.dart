import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookBoxCompo extends StatelessWidget {
  final String img;
  final String gname;
  final String number;
  final String rating;
  final VoidCallback onPressed;
  const BookBoxCompo({
    super.key,
    required this.img,
    required this.gname,
    required this.number,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes the shadow direction
              ),
            ]),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.95,

              child: Image(
                image: NetworkImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),

              // child: Image.network(
              //   img,
              //   fit: BoxFit.cover,
              // ),
              // color: Colors.grey.shade300,
              //child: ,
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.70,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  width: MediaQuery.of(context).size.width * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red.shade400,
                  ),
                  child: const Center(child: Text('OPEN')),
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              left: MediaQuery.of(context).size.width * 0.03,
              child: Row(
                children: [
                  Text(
                    '$rating/5',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.w600),
                  ),
                  //Image.asset('assets/icon/Star Icon.svg'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Star Icon.svg',
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.23,
              left: MediaQuery.of(context).size.width * 0.03,
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  // SvgPicture.asset(
                  //   'assets/icon/Location point.svg',
                  // ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    gname,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                  ),
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.27,
                left: MediaQuery.of(context).size.width * 0.03,
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      '$number',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.23,
              left: MediaQuery.of(context).size.width * 0.70,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // foregroundColor: Colors.white,
                    // backgroundColor: Colors.blue, // Background color
                    side: BorderSide(
                        // color: kMyColor
                        color: Colors.green), // Outline border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    'Book',
                    style: TextStyle(color: Colors.green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
