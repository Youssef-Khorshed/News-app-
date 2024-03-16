import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsService {
  NewsService();

  final Dio dio = Dio();
  final String baseUrl = 'https://newsapi.org/v2';
  final String apiKey = 'f35760322f714f8e8cd54b3588af9630';

  Future<List<ArticlesModel>> getNews({required String category}) async {
    try {
      Response response = await dio
          .get('$baseUrl/everything?apiKey=$apiKey&searchIn=title&q=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticlesModel> articlesList = [];
      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(jsonData: article);
        articlesList.add(articlesModel);
      }
      return articlesList;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response?.data['message'] ??
          'there was an error, please try later');
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error, please try later');
    }
  }
}
