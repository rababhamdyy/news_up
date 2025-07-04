abstract class CategoryState {}

class CategoryInitial extends CategoryState {
  final String selectedCategory;

  CategoryInitial({this.selectedCategory = 'General'});
}

class CategorySelected extends CategoryState {
  final String selectedCategory;

  CategorySelected({required this.selectedCategory});
}