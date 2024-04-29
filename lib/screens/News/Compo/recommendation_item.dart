import 'package:flutter/material.dart';
import 'package:my_cricket/models/article_model.dart';

//import 'package:my_cricket/models/news_item.dart';

class RecommendationItem extends StatelessWidget {
  //final NewsItem newsItem;
  final Article article;
  const RecommendationItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: buildNetworkImage(article.urlToImage as String),
            // child: Image.network(
            //   article.urlToImage as String,
            //   height: 120,
            //   width: 150,
            //   fit: BoxFit.cover,
            // ),
            // child: CachedNetworkImage(
            //   imageUrl: article.urlToImage as String,
            //   height: 120,
            //   width: 150,
            //   fit: BoxFit.cover,
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //newsItem.category,
                  article.source?.name as String,

                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  article.title as String,
                  style: TextStyle(fontSize: 13.0),
                  //style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${article.author as String} • ${article.publishedAt}',
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                  // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //       color: Colors.grey,
                  //     ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildNetworkImage(String imgPath) {
  try {
    return Image.network(
      imgPath,
      height: 120,
      width: 150,
      fit: BoxFit.cover,
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
          height: 120,
          width: 150,
          fit: BoxFit.cover,
        );
      },
    );
  } catch (e) {
    return Image.asset(
      'assets/images/notfound.jpg',
      height: 120,
      width: 150,
      fit: BoxFit.cover,
    );
  }
}
