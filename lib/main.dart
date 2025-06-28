import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_up/services/news_service.dart';
import 'package:news_up/views/home_view.dart';

void main() {
  NewsService(Dio()).getNews();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeView());
  }
}
