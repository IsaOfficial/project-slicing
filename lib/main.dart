import 'package:flutter/material.dart';
import 'features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Slicing Project',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'SF-Pro', // Menambahkan Custom Fonts
      ),
      home: const HomePage(),
    );
  }
}
