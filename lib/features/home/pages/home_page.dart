import 'package:flutter/material.dart';
import 'package:project_slicing/features/home/widgets/stories.dart'; // Sesuaikan dengan path sebenarnya

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Stories(), // Memanggil widget Stories
            // Tambahkan widget lain di sini
          ],
        ),
      ),
    );
  }
}
