import 'package:flutter/material.dart';
import 'btm_navbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, String>> categories = [
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 1'},
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 2'},
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 3'},
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 4'},
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 5'},
    {'image': 'assets/images/Fried Rice.jpeg', 'name': 'Category 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/icons/BackArrow.png'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: const Text('Categories',
            style: TextStyle(color: Color(0xFFFD5D69))),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                _buildCircleIcon('assets/icons/Notification.png'),
                const SizedBox(width: 10),
                _buildCircleIcon('assets/icons/Search.png'),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(categories[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['name']!,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }

  Widget _buildCircleIcon(String assetName) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color(0xFFFFC6C9),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        assetName,
        color: const Color(0xFFEC888D),
        height: 24,
        width: 24,
      ),
    );
  }
}
