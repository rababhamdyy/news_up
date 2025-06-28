import 'package:flutter/material.dart';
import 'package:news_up/models/horizontal_model.dart';
import 'package:news_up/widgets/horizontal_card_widget.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
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
          );
        },
      ),
    );
  }
}
