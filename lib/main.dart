import 'package:flutter/material.dart';
import 'home_page.dart';
import 'community_page.dart';
import 'categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Halaman utama yang sudah ada
      routes: {
        '/home': (context) => const HomePage(),
        '/community': (context) => const CommunityPage(),
        '/categories': (context) => const CategoriesPage(),
      },
    );
  }
}
