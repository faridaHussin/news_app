import 'package:flutter/material.dart';
import 'package:news_app/Ui/Home/news/NewsWidget.dart';
import 'package:news_app/api/ApiManager.dart';

import '../../../model/SourceResponse/Source.dart';

class NewsListWidget extends StatelessWidget {
  Source source;

  NewsListWidget(this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsList(newsList![index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}
