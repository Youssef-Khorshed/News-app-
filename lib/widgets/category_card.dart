import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/utils/responsive_font_size.dart';
import 'package:news_app/views/category_view.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryViews(
              categoryName: category.categoryName,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(category.categoryAssetImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: getResponsiveFontSize(context, fontSize: 100),
        width: getResponsiveFontSize(context, fontSize: 190),
        alignment: Alignment.center,
        child: Text(
          category.categoryName,
          style: TextStyle(
            color: Colors.white,
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
