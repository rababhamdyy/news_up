import 'package:flutter/material.dart';
import 'package:news_up/models/horizontal_model.dart';

class HorizontalCardWidget extends StatelessWidget {
  final HorizontalModel imageCard;
  final bool isFirst;
  final bool isSelected;
  final VoidCallback onTap;

  const HorizontalCardWidget({
    super.key,
    required this.imageCard,
    this.isFirst = false,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 180,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: Colors.red, width: 3) : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imageCard.image, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
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
      ),
    );
  }
}
