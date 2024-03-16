import 'package:flutter/material.dart';
import 'package:news_app/utils/responsive_font_size.dart';
import 'package:news_app/widgets/news_listview_builder.dart';

class CategoryViews extends StatelessWidget {
  const CategoryViews({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '$categoryName News',
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 22),
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            NewsListViewBuilder(
              category: categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
