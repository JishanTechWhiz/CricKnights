import 'package:flutter/material.dart';
import 'package:my_cricket/Service/api_service.dart';
import 'package:my_cricket/models/article_model.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            // Data has been loaded, display it in a ListView
            //List<Article>? articles = snapshot.data;
            // return ListView.builder(
            //   itemCount: articles?.length,
            //   itemBuilder: (context, index) => ListTile(
            //     title: Text(articles![index].title),
            //     //subtitle: Text(articles[index].content),
            //   ),
            // );
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Article article = snapshot.data![index];
                return ListTile(
                  title: Text(article.content ?? 'No Contents'),
                  // Add more fields from the Article model as needed
                );
              },
            );
          } else if (snapshot.hasError) {
            // There was an error while fetching data
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Data is still loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
