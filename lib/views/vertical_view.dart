import 'package:flutter/material.dart';
import 'package:news_up/models/article_model.dart';
import 'package:news_up/widgets/vertical_card_widget.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, cardIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: VerticalCardWidget(articleModel: articles[cardIndex]),
          );
        },
      ),
    );
  }
}
