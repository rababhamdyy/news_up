import 'package:flutter/material.dart';
import 'package:news_up/models/horizontal_model.dart';
import 'package:news_up/views/category_view.dart';

class HorizontalCardWidget extends StatelessWidget {
  final HorizontalModel imageCard;
  final bool isFirst;
  const HorizontalCardWidget({
    super.key,
    required this.imageCard,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView();
            },
          ),
        );
      },
      child: Container(
        height: 120,
        width: 180,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageCard.image, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ),
            Center(
              child: Text(
                imageCard.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
