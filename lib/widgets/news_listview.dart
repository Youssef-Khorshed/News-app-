import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/utils/adaptive_layout.dart';
import 'package:news_app/widgets/small_device_news.dart';
import 'package:news_app/widgets/large_device_news.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articlesList});

  final List<ArticlesModel> articlesList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: articlesList.length,
      itemBuilder: (context, index) {
        return AdaptiveLayout(
          smallDevices: (context) =>
              SmallDeviceNews(article: articlesList[index]),
          largeDevices: (context) =>
              LargeDeviceNews(article: articlesList[index]),
        );
      },
    );
  }
}
