import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_up/models/article_model.dart';
import 'package:news_up/services/news_service.dart';
import 'package:news_up/views/vertical_view.dart';

class VerticalListViewBuilder extends StatefulWidget {
  const VerticalListViewBuilder({super.key});

  @override
  State<VerticalListViewBuilder> createState() =>
      _VerticalListViewBuilderState();
}

class _VerticalListViewBuilderState extends State<VerticalListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      articles = await NewsService(Dio()).getNews();

      setState(() {
        isLoading = false;
        if (articles.isEmpty) {
          errorMessage = 'No articles found. Please try again.';
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error loading news: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (errorMessage != null) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(errorMessage!),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: getGeneralNews,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (articles.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('No articles available'),
          ),
        ),
      );
    }

    return VerticalListView(articles: articles);
  }
}
