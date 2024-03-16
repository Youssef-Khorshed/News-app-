import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
