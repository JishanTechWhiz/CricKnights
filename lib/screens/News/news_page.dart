import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cricket/component/coustom_bottom_nav_bar.dart';
import 'package:my_cricket/helpers/constants.dart';
import 'package:my_cricket/helpers/enums.dart';
import 'package:my_cricket/models/article_model.dart';
import 'package:my_cricket/screens/Home/homepage.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/screens/News/Compo/custom_carousel_slider.dart';
import 'package:my_cricket/screens/News/Compo/home_title_widget.dart';
import 'package:my_cricket/screens/News/Compo/recommendation_item.dart';
import 'package:my_cricket/screens/News/bookmarks_page.dart';
import 'package:my_cricket/screens/News/news_details_page.dart';
import 'package:my_cricket/Service/api_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen> {
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
      // setState(() {
      //   isLoading = true;
      // });

      List<Article> fetchedArticles = await client.getArticle();
      setState(() {
        articles = fetchedArticles;
        //isLoading = false;
      });
      // Set up a timer to fetch news again after 5 minutes
      // Timer(Duration(seconds: 5), () {
      //   fetchArticles();
      //   isLoading = false;
      // });
    } catch (error) {
      // Handle error, e.g., show an error message
      print("Error fetching articles: $error");
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            children: const [
              TextSpan(
                text: "Cric",
                style: TextStyle(
                  color: ksecondaryColor,
                  fontFamily: "Reggae One",
                ),
              ),
              TextSpan(
                text: "NEWS",
                style: TextStyle(
                  color: kPrimaryColors,
                  fontFamily: "Reggae One",
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/receipt.svg",
                // ignore: deprecated_member_use
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyBookmark(articles: articles)));
              }),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.news,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                const HomeTitleWidget(title: 'Breaking News'),
                const SizedBox(height: 8.0),
                const CustomCarouselSlider(),
                const SizedBox(height: 16.0),
                const HomeTitleWidget(title: 'Recommendation'),
                const SizedBox(height: 8.0),
                ...articles
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
          ),
        ),
      ),
    );
  }
}
