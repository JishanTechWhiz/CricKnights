import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/screens/News/news_page.dart';

class HomeTitleWidget extends StatelessWidget {
  final String title;
  const HomeTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => const NewsScreen(),
              ),
            );
          },
          child: const Text('View All'),
        ),
      ],
    );
  }
}
