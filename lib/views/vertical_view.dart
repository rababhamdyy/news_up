import 'package:flutter/material.dart';
import 'package:news_up/models/article_model.dart';
import 'package:news_up/widgets/vertical_card_widget.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
    required this.articles,
    required this.selectedCategoty,
  });
  final List<ArticleModel> articles;
  final String selectedCategoty;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '( $selectedCategoty News )',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: VerticalCardWidget(articleModel: articles[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
