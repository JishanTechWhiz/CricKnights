import 'package:flutter/material.dart';
import 'package:my_cricket/models/article_model.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/screens/News/Compo/news_details_app_bar.dart';
import 'package:my_cricket/screens/News/Compo/news_details_body.dart';

class NewsDetailsPage extends StatelessWidget {
  final int index;
  final List<Article> articles;

  const NewsDetailsPage(
      {super.key, required this.index, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                slivers: [
                  NewsDetailsAppBar(
                    index: index,
                    articles: articles,
                  ),
                  SliverToBoxAdapter(
                    child: NewsDetailsBody(
                      article: articles[index],
                    ),
                  ),
                  // SliverPadding(
                  //     padding: EdgeInsets.only(bottom: 1000)),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.25,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
