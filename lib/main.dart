import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'news/presenters/news_screen.dart';
import 'news/presenters/state/news_controller.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<NewsController>(NewsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turbo News',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const NewsScreen(),
    );
  }
}
