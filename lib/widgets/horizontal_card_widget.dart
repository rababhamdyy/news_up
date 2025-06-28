import 'package:flutter/material.dart';
import 'package:news_up/models/horizontal_model.dart';

class HorizontalCardWidget extends StatelessWidget {
  const HorizontalCardWidget({super.key, required this.imageCard});

  final HorizontalModel imageCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 120,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imageCard.image),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            imageCard.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
