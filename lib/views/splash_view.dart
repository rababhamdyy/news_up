import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/news_cubit.dart';
import 'package:news_up/views/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize news data when splash screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsCubit>().loadNews();
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/news_logo.png")),
    );
  }
}
