import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/utils/responsive_font_size.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticlesModel>> getDataFuture;

  @override
  void initState() {
    super.initState();
    getDataFuture = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: getDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articlesList: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'There was an error, please try later !',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
