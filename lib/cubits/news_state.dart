import 'package:news_up/models/article_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<ArticleModel> articles;
  final String? category;

  NewsLoaded({required this.articles, this.category});
}

class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}