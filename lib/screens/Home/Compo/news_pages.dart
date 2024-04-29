import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/Service/api_service.dart';
//import 'package:my_cricket/helpers/size_config.dart';
import 'package:my_cricket/models/article_model.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/screens/News/Compo/recommendation_item.dart';
import 'package:my_cricket/screens/News/news_details_page.dart';

class MyNews extends StatefulWidget {
  const MyNews({super.key});

  @override
  State<MyNews> createState() => _MyNews();
}

class _MyNews extends State<MyNews> {
  ApiService client = ApiService();
  List<Article> articles = [];
  //bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Call the function to fetch articles when the widget is created
    fetchArticles();
  }

  // Function to fetch articles using ApiService
  void fetchArticles() async {
    try {
      List<Article> fetchedArticles = await client.getArticle();
      setState(() {
        articles = fetchedArticles;
      });
    } catch (error) {
      // Handle error, e.g., show an error message
      print("Error fetching articles: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        children: [
          ...articles
              .take(3)
              .map((article) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        final index = articles.indexOf(article);

                        Navigator.of(context, rootNavigator: true)
                            .push(
                              CupertinoPageRoute(
                                builder: (_) => NewsDetailsPage(
                                  index: index,
                                  articles: articles,
                                ),
                              ),
                            )
                            .then((value) => setState(
                                  () {},
                                ));
                      },
                      child: RecommendationItem(article: article),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
