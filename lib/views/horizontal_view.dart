import 'package:flutter/material.dart';
import 'package:news_up/models/horizontal_model.dart';
import 'package:news_up/widgets/horizontal_card_widget.dart';

class HorizontalListView extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const HorizontalListView({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageCards.length,
        itemBuilder: (context, cardIndex) {
          return HorizontalCardWidget(
            imageCard: imageCards[cardIndex],
            isSelected: imageCards[cardIndex].title == selectedCategory,
            onTap: () => onCategorySelected(imageCards[cardIndex].title),
          );
        },
      ),
    );
  }
}
