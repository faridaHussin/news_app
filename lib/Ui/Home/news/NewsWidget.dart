import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/newsResponse/News.dart';

class NewsList extends StatelessWidget {
  News news;

  NewsList(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Text(news.author ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 10)),
          Text(
            news.title ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            news.publishedAt ?? '',
            textAlign: TextAlign.end,
            style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
