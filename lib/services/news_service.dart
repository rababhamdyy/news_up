import 'package:dio/dio.dart';
import 'package:news_up/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?q=science&apiKey=db2d06a3213b48e5a0a168b9f86245d2');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            description: article['description']);

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
