import 'package:flutter/material.dart';
import 'package:my_cricket/models/article_model.dart';
//import 'package:my_cricket/models/news_item.dart';
import 'package:my_cricket/screens/News/Compo/app_bar_icon.dart';

class NewsDetailsAppBar extends StatefulWidget {
  final int index;
  final List<Article> articles;
  const NewsDetailsAppBar(
      {super.key, required this.index, required this.articles});

  @override
  State<NewsDetailsAppBar> createState() =>
      _NewsDetailsAppBarState(articles: articles);
}

class _NewsDetailsAppBarState extends State<NewsDetailsAppBar> {
  final List<Article> articles;

  _NewsDetailsAppBarState({required this.articles});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AppBarIcon(
          icon: Icons.chevron_left,
          iconSize: 30,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      leadingWidth: 40,
      actions: [
        AppBarIcon(
          icon: articles[widget.index].isFavorite
              ? Icons.bookmark
              : Icons.bookmark_border_outlined,
          onTap: () {
            // setState(() {
            //   articles[widget.index] = articles[widget.index]
            //       .copyWith(isFavorite: articles[widget.index].isFavorite);
            // });
          },
        ),
        const SizedBox(width: 6.0),
        const AppBarIcon(icon: Icons.menu),
        const SizedBox(width: 6.0),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: buildNetworkImage(
                  articles[widget.index].urlToImage as String),
              //child: Image.network(
              //articles[widget.index].urlToImage as String,
              //fit: BoxFit.cover,
              //),
              // child: CachedNetworkImage(
              //   imageUrl: articles[widget.index].urlToImage as String,
              //   fit: BoxFit.cover,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
            ),
            // const Positioned.fill(
            //   child: Opacity(
            //     opacity: 0.15,
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 50,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articles[widget.index].source?.name as String,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  //const SizedBox(height: 12.0),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      '',
                      //articles[widget.index].title as String,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${articles[widget.index].author} • ${articles[widget.index].publishedAt}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(36.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildNetworkImage(String imgPath) {
  try {
    return Image.network(
      imgPath,
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
          fit: BoxFit.cover,
        );
      },
    );
  } catch (e) {
    return Image.asset(
      'assets/images/notfound.jpg',
      fit: BoxFit.cover,
    );
  }
}
