import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/utils/responsive_font_size.dart';
import 'package:url_launcher/url_launcher.dart';

class LargeDeviceNews extends StatelessWidget {
  const LargeDeviceNews({super.key, required this.article});

  final ArticlesModel article;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(article.url));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: article.image == null
                    ? Image.asset(
                        'assets/News.jpg',
                        width: screenWidth,
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        article.image!,
                        width: screenWidth,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    article.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
