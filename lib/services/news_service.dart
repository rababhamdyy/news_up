import 'package:dio/dio.dart';
import 'package:news_up/models/article_model.dart';

class NewsService {
  final _dio = Dio();
  final _baseUrl = 'https://newsapi.org';
  final _apikey = 'db2d06a3213b48e5a0a168b9f86245d2';

  NewsService(Dio dio);

  Future<List<ArticleModel>> getNews({String? category, String? country}) async {
    try {
      String url = '$_baseUrl/v2/top-headlines?apiKey=$_apikey';
      
      // Add country parameter only if specified
      if (country != null && country.isNotEmpty) {
        url += '&country=${country.toLowerCase()}';
      }

      // Add category parameter if provided
      if (category != null && category.toLowerCase() != 'general') {
        url += '&category=${category.toLowerCase()}';
      }

      final response = await _dio.get(url);

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

  Future<List<ArticleModel>> getNewsByCategory(String category, {String? country}) async {
    return getNews(category: category, country: country);
  }
}
