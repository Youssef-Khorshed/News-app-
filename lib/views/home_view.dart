import 'package:flutter/material.dart';
import 'package:news_app/utils/responsive_font_size.dart';
import 'package:news_app/widgets/category_listview.dart';
import 'package:news_app/widgets/news_listview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontSize: getResponsiveFontSize(context, fontSize: 24),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontSize: getResponsiveFontSize(context, fontSize: 24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            NewsListViewBuilder(
              category: 'News',
            ),
          ],
        ),
      ),
    );
  }
}
