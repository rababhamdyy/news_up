import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/category_cubit.dart';
import 'package:news_up/cubits/category_state.dart';
import 'package:news_up/cubits/news_cubit.dart';
import 'package:news_up/views/horizontal_view.dart';
import 'package:news_up/widgets/vertical_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(fontWeight: FontWeight.w700)),
            Text(
              ' UP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, categoryState) {
              return IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: () {
                  String currentCategory = 'General';
                  if (categoryState is CategorySelected) {
                    currentCategory = categoryState.selectedCategory;
                  } else if (categoryState is CategoryInitial) {
                    currentCategory = categoryState.selectedCategory;
                  }
                  context.read<NewsCubit>().loadNewsByCategory(currentCategory);
                },
              );
            },
          ),
        ],
      ),
      body: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategorySelected) {
            context.read<NewsCubit>().loadNewsByCategory(
              state.selectedCategory,
            );
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HorizontalListView()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: VerticalListViewBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
