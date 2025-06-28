import 'package:dio/dio.dart';
import 'package:news_up/models/article_model.dart';

class NewsService {
  final _dio = Dio();
  final _baseUrl = 'https://newsapi.org';
  final _apikey = 'db2d06a3213b48e5a0a168b9f86245d2';

  NewsService(Dio dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/v2/top-headlines?country=us&apiKey=$_apikey',
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'] ?? [];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        try {
          String title = article['title'] ?? 'No Title Available';
          String? image = article['urlToImage'];
          String? description = article['description'];

          if (title.isNotEmpty && title != 'null') {
            ArticleModel articleModel = ArticleModel(
              image: image,
              title: title,
              description: description,
            );

            articlesList.add(articleModel);
          }
        } catch (e) {
          continue;
        }
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
