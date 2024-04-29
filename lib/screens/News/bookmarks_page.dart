import 'package:flutter/material.dart';
import 'package:my_cricket/models/article_model.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/screens/News/Compo/recommendation_item.dart';

class MyBookmark extends StatelessWidget {
  final List<Article> articles;
  const MyBookmark({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: BookmarksPage(
        articles: articles,
      ),
    );
  }
}

class BookmarksPage extends StatelessWidget {
  final List<Article> articles;
  const BookmarksPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final favoritedItems = articles.where((element) => element.isFavorite);

    if (favoritedItems.isEmpty) {
      return Center(
        child: Text(
          'No Bookmarks Available!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: favoritedItems
              .map((favoritedItem) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecommendationItem(article: favoritedItem),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
