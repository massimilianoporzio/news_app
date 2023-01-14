import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';

import 'features/show_news/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'news App',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
          colorScheme:
              const ColorScheme.light().copyWith(secondary: Palette.deepBlue)),
      home: const HomePage(),
    );
  }
}
