import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_cricket/screens/BoxCricket/BookBoxCompo.dart';
import 'package:my_cricket/screens/BoxCricket/SearchBox.dart';
import 'package:my_cricket/screens/BoxCricket/SingleBox.dart';

class BookBoxCricket extends StatefulWidget {
  const BookBoxCricket({Key? key}) : super(key: key);

  @override
  _BookBoxCricketState createState() => _BookBoxCricketState();
}

class _BookBoxCricketState extends State<BookBoxCricket> {
  late Future<List<Map<String, dynamic>>> futureBoxGrounds;

  @override
  void initState() {
    super.initState();
    futureBoxGrounds = fetchBoxGrounds();
  }

  Future<List<Map<String, dynamic>>> fetchBoxGrounds() async {
    //final response =
    //await http.get(Uri.parse('http://127.0.0.1:8000/boxgrounds/'));
    final response = await http
        .get(Uri.parse('https://cricknightx.pythonanywhere.com/boxgrounds/'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBox(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: futureBoxGrounds,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CustomShimmer());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var boxGround = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookBoxCompo(
                          // boxId: boxGround['id'] ?? '',
                          img: boxGround['boxImg'] ?? '',
                          // address: '${boxGround['Location']}',
                          gname:
                              boxGround['groundName'] ?? 'Detail not provide',
                          number: boxGround['phone'] ?? 'Detail not provide',
                          rating: boxGround['rating'] ?? '0.0',
                          onPressed: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) => DetailPage(
                                        boxId: boxGround['id'] ?? '',
                                        img: boxGround['boxImg'] ?? '',
                                        address:
                                            '${boxGround['groundName'] ?? ''}, ${boxGround['Location']}',
                                        number: boxGround['phone'] ??
                                            'Detail not provided',
                                        rating: boxGround['rating'] ?? '0.0',
                                        gName: boxGround['groundName'] ?? '',
                                        gPrice: boxGround['Price'] ?? '',
                                      )),
                            );

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DetailPage(
                            //             img: boxGround['boxImg'] ?? '',
                            //             address:
                            //                 '${boxGround['groundName'] ?? ''}, ${boxGround['Location']}',
                            //             number: boxGround['phone'] ??
                            //                 'Detail not provided',
                            //             rating: boxGround['rating'] ?? '0.0',
                            //           )),
                            // );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedOpacity(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            opacity: 0.5, // Adjust opacity as needed
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
                ],
              ),
              child: Stack(
                children: [
                  // Placeholder for shimmer effect
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment(-0.8, 0),
                        end: Alignment(0.8, 0),
                        colors: [
                          Colors.grey[300]!,
                          Colors.grey[100]!,
                          Colors.grey[300]!,
                        ],
                        stops: const [0, 0.5, 1],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text placeholder
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.white,
                          ),
                          // Rating placeholder
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.15,
                            color: Colors.white,
                          ),
                          // Name placeholder
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.white,
                          ),
                          // Number placeholder
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.white,
                          ),
                          // Book button placeholder
                          Container(
                            height: 36,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
