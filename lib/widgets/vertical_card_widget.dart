import 'package:flutter/material.dart';
import 'package:news_up/models/article_model.dart';

class VerticalCardWidget extends StatelessWidget {
  const VerticalCardWidget({super.key, required this.articleModel});


  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(articleModel.image!),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.description ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}
