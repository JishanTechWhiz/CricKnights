//Now let's create the article model
// for that we just need to copy the property from the json structure
// and make a dart object

import 'source_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  final bool isFavorite;

  //Now let's create the constructor
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.isFavorite = false,
  });

  //And now let's create the function that will map the json into a list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
  Article copyWith({
    bool? isFavorite,
  }) {
    return Article(
      isFavorite: isFavorite ?? this.isFavorite,
    );

    //Article copyWith({required bool isFavorite}) {}
  }
}
