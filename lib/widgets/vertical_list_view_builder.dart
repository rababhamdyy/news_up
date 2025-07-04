import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/news_cubit.dart';
import 'package:news_up/cubits/news_state.dart';
import 'package:news_up/views/vertical_view.dart';

class VerticalListViewBuilder extends StatefulWidget {
  const VerticalListViewBuilder({super.key});

  @override
  State<VerticalListViewBuilder> createState() =>
      _VerticalListViewBuilderState();
}

class _VerticalListViewBuilderState extends State<VerticalListViewBuilder> {
  @override
  void initState() {
    super.initState();
    // Load initial news when widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsCubit>().loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator(color: Colors.red)),
          );
        } else if (state is NewsLoaded) {
          return VerticalListView(
            articles: state.articles,
            selectedCategoty: state.category ?? 'General',
          );
        } else if (state is NewsError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator(color: Colors.red)),
          );
        }
      },
    );
  }
}
