import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_up/models/article_model.dart';
import 'package:news_up/services/news_service.dart';
import 'package:news_up/views/vertical_view.dart';

class VerticalListViewBuilder extends StatefulWidget {
  const VerticalListViewBuilder({super.key});

  @override
  State<VerticalListViewBuilder> createState() => _VerticalListViewBuilderState();
}

class _VerticalListViewBuilderState extends State<VerticalListViewBuilder> {

  var future ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VerticalListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "oops there was an error, try later",
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator(color: Colors.red)),
          );
        }
      },
    );
  }
}
