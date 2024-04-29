// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:my_cricket/models/article_model.dart';

// class ApiService {
//   //let's add an Endpoint URL, you can check the website documentation
//   // and learn about the different Endpoint
//   //for this example I'm going to use a single endpoint

//   //NOTE: make sure to use your OWN apikey, you can make a free acount and
//   // choose a developer option it's FREE
//   final endPointUrl = Uri.parse(
//       "https://newsapi.org/v2/top-headlines?category=sports&country=in&q=cricket&apiKey=bcf8d90e42c24aaf96727518f9fd5c2c");

//   // final endPointUrl = Uri.parse(
//   //     "https://newsapi.org/v2/top-headlines?category=sports&country=in&apiKey=bcf8d90e42c24aaf96727518f9fd5c2c");

//   // final endPointUrl =
//   //     "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bcf8d90e42c24aaf96727518f9fd5c2c";

//   Future<List<Article>> getArticle() async {
//     Response res = await get(endPointUrl);

//     //first of all let's check that we got a 200 statu code: this mean that the request was a succes
//     if (res.statusCode == 200) {
//       Map<String, dynamic> json = jsonDecode(res.body);

//       List<dynamic> body = json['articles'];

//       //this line will allow us to get the different articles from the json file and putting them into a list
//       List<Article> articles =
//           body.map((dynamic item) => Article.fromJson(item)).toList();

//       return articles;
//     } else {
//       throw ("Can't get the Articles");
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart';
import 'package:my_cricket/models/article_model.dart';

class ApiService {
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?category=sports&country=in&q=cricket&apiKey=bcf8d90e42c24aaf96727518f9fd5c2c");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      if (json['articles'] != null) {
        // Filter out articles with null values
        List<dynamic> body = json['articles']
            .where((article) =>
                article['author'] != null &&
                article['title'] != null &&
                article['description'] != null &&
                article['urlToImage'] != null &&
                article['publishedAt'] != null &&
                article['source']['name'] != null)
            .toList();

        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
      } else {
        throw ("Articles data is null");
      }
    } else {
      throw ("Can't get the Articles");
    }
  }
}
