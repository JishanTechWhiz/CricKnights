import 'package:flutter/material.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/models/article_model.dart';

class NewsDetailsBody extends StatelessWidget {
  //final NewsItem newsItem;
  final Article article;
  const NewsDetailsBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  article.urlToImage as String,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                article.author as String,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            article.title as String,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16.0),
          Text(
            article.description as String,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
