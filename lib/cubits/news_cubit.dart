import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/news_state.dart';
import 'package:news_up/services/news_service.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService _newsService;

  NewsCubit({required NewsService newsService})
    : _newsService = newsService,
      super(NewsInitial());

  Future<void> loadNews({String? category, String? country}) async {
    emit(NewsLoading());

    try {
      // If country is null or empty, don't pass it to get all countries
      final articles = await _newsService.getNews(
        category: category,
        country: country?.isNotEmpty == true ? country : null,
      );
      emit(NewsLoaded(articles: articles, category: category));
    } catch (e) {
      emit(NewsError(message: 'Failed to load news: ${e.toString()}'));
    }
  }

  Future<void> loadNewsByCategory(String category, {String? country}) async {
    emit(NewsLoading());

    try {
      // If country is null or empty, don't pass it to get all countries
      final articles = await _newsService.getNewsByCategory(
        category,
        country: country?.isNotEmpty == true ? country : null,
      );
      emit(NewsLoaded(articles: articles, category: category));
    } catch (e) {
      emit(
        NewsError(
          message: 'Failed to load news for $category: ${e.toString()}',
        ),
      );
    }
  }
}
