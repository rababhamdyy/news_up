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
  @override
  void initState() {
    super.initState();
    isLoading = false;
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()))
        : articles.isNotEmpty
            ? VerticalListView(articles: articles)
            : const SliverToBoxAdapter(
                child: Center(child: Text('oops! there wes an error try again')),
              );
  }
}
