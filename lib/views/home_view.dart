import 'package:flutter/material.dart';
import 'package:news_up/views/horizontal_view.dart';
import 'package:news_up/widgets/vertical_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedCategory = 'General';

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HorizontalListView(
              selectedCategory: selectedCategory,
              onCategorySelected: onCategorySelected,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: VerticalListViewBuilder(selectedCategory: selectedCategory),
          ),
        ],
      ),
    );
  }
}
