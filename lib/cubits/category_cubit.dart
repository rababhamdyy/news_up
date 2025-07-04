import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void selectCategory(String category) {
    emit(CategorySelected(selectedCategory: category));
  }

  String get currentCategory {
    if (state is CategorySelected) {
      return (state as CategorySelected).selectedCategory;
    }
    return 'General';
  }
}
