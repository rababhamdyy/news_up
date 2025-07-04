import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_up/cubits/category_cubit.dart';
import 'package:news_up/cubits/news_cubit.dart';
import 'package:news_up/services/news_service.dart';
import 'package:news_up/views/splash_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(newsService: NewsService(Dio())),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
