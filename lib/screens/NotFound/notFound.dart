import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/helpers/constants.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text('Page under construction'),
        backgroundColor: kMyColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
              child: Column(
            children: [
              Text(
                'Page under',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Construction',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "We're launching soon ",
                style: TextStyle(color: Colors.black54, fontSize: 22),
              )
            ],
          )),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.90,
              color: Colors.white,
              child: FlareActor(
                "assets/rive/work.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "coding",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
