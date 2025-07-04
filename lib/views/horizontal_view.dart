import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/category_cubit.dart';
import 'package:news_up/cubits/category_state.dart';
import 'package:news_up/models/horizontal_model.dart';
import 'package:news_up/widgets/horizontal_card_widget.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        String selectedCategory = 'General';
        if (state is CategorySelected) {
          selectedCategory = state.selectedCategory;
        } else if (state is CategoryInitial) {
          selectedCategory = state.selectedCategory;
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageCards.length,
            itemBuilder: (context, cardIndex) {
              return HorizontalCardWidget(
                imageCard: imageCards[cardIndex],
                isSelected: imageCards[cardIndex].title == selectedCategory,
                onTap:
                    () => context.read<CategoryCubit>().selectCategory(
                      imageCards[cardIndex].title,
                    ),
              );
            },
          ),
        );
      },
    );
  }
}
