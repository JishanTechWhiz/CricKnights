import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cricket/Service/api_service.dart';
import 'package:my_cricket/models/article_model.dart';
import 'package:my_cricket/screens/News/news_details_page.dart';
//import 'package:my_cricket/models/news_item.dart';
//import 'package:my_cricket/screens/News/news_details_page.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final _controller = CarouselController();
  int _current = 0;
  ApiService client = ApiService();
  List<Article> articles = [];

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
    final List<Widget> imageSliders = articles
        .take(4)
        .map((item) => InkWell(
              onTap: () {
                final index = articles.indexOf(item);
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(
                    builder: (_) =>
                        NewsDetailsPage(index: index, articles: articles),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Stack(
                      children: <Widget>[
                        buildNetworkImage(item.urlToImage as String),
                        // Image.network(item.urlToImage as String,
                        //     fit: BoxFit.cover, width: 1000.0),
                        // CachedNetworkImage(
                        //   imageUrl: item.urlToImage as String,
                        //   fit: BoxFit.cover,
                        //   width: 1000.0,
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.error),
                        // ),
                        Positioned(
                          top: 10,
                          left: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.source?.name as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  '${item.author} • ${item.publishedAt}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                child: Text(
                                  //item.title,
                                  item.source?.name as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: articles.asMap().entries.take(4).map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 25.0 : 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: _current == entry.key
                        ? BorderRadius.circular(8.0)
                        : null,
                    shape: _current == entry.key
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    color: _current == entry.key
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.3)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

Widget buildNetworkImage(String imgPath) {
  try {
    return Image.network(
      imgPath,
      fit: BoxFit.cover,
      width: 1000.0,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          'assets/images/notfound.jpg',
          fit: BoxFit.cover,
          width: 1000.0,
        );
      },
    );
  } catch (e) {
    return Image.asset(
      'assets/images/notfound.jpg',
      fit: BoxFit.cover,
      width: 1000.0,
    );
  }
}
