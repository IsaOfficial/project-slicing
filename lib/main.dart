import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snacks',
    'Desserts',
    'Cake',
    'Drinks',
  ];

  final List<Map<String, String>> _trendingRecipes = [
    {
      'name': 'Spaghetti Carbonara',
      'image': 'assets/images/Salami and Cheese Pizza.jpg',
      'ingredients': 'Spaghetti, Eggs, Cheese, Bacon',
    },

    // Tambahkan resep lain di sini
  ];

  final List<Map<String, String>> _yourRecipes = [
    {
      'image': 'assets/images/Tiramisu.jpg',
      'name': 'Tiramisu',
      'time': '20 min',
      'rating': '4.5',
    },
    {
      'image': 'assets/images/Chicken Burger.jpg',
      'name': 'Chicken Burger',
      'time': '15 min',
      'rating': '4.7',
    },
  ];

  final List<Map<String, String>> _topChefs = [
    {
      'image': 'assets/images/Emily.jpg',
      'name': 'Emily',
    },
    {
      'image': 'assets/images/Jessica.jpg',
      'name': 'Jessica',
    },
    {
      'image': 'assets/images/Joseph.jpg',
      'name': 'Joseph',
    },
    {
      'image': 'assets/images/Andrew.jpg',
      'name': 'Andrew',
    },
  ];

  final List<Map<String, String>> _recentlyAdded = [
    {
      'image': 'assets/images/Lemonade.jpg',
      'name': 'Lemonade',
      'description': 'With Lemonade',
      'time': '3 min',
      'rating': '5',
    },
    {
      'image': 'assets/images/Watermelon Juice.jpg',
      'name': 'Watermelon Juice',
      'description': 'With Watermelon',
      'time': '5 min',
      'rating': '4.5',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi! Isa',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  color: Color(0xFFFD5D69),
                ),
              ),
              Text(
                'What are you cooking today?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC6C9),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/Notification.png',
                    color: const Color(0xFFEC888D),
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC6C9),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/Search.png',
                    color: const Color(0xFFEC888D),
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildCategoryList(),
              _buildTrendingRecipes(),
              const SizedBox(height: 16),
              _buildYourRecipes(),
              const SizedBox(height: 16),
              _buildTopChefs(),
              const SizedBox(height: 16),
              _buildRecentlyAdded(),
              const SizedBox(height: 16),
              Center(
                child: Text('Selected Index: $_selectedIndex'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
            height: 70,
            margin: const EdgeInsets.symmetric(
                horizontal: 50, vertical: 1), // Kurangi lebar container
            decoration: BoxDecoration(
              color: const Color(0xFFFD5D69),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem('Home.png', 0),
                _buildNavItem('Community.png', 1),
                _buildNavItem('Categories.png', 2),
                _buildNavItem('Profile.png', 3),
              ],
            )),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => _onCategoryTapped(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFD5D69) : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFFD5D69),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingRecipes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trending Recipes',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: _trendingRecipes.map((recipe) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 12,
                    right: 12,
                    top: 12,
                    child: Container(
                      height: 24, // Tinggi tetap untuk kontainer deskripsi
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFFD5D69),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  recipe['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/Time.png',
                                    color: const Color(0xFFEC888D),
                                    height: 14,
                                    width: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '30 min',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xFFEC888D),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: _truncateText(
                                        recipe['ingredients']!, 25),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xFFEC888D),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Image.asset(
                                    'assets/icons/Star.png',
                                    color: const Color(0xFFEC888D),
                                    height: 14,
                                    width: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              recipe['image']!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFC6C9),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/icons/Favorite.png',
                                  color: const Color(0xFFEC888D),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 55),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _truncateText(String text, int maxWords) {
    List<String> words = text.split(' ');
    if (words.length > maxWords) {
      return words.take(maxWords).join(' ') + '...';
    }
    return text;
  }

  Widget _buildYourRecipes() {
    return Container(
      color: const Color(0xFFFD5D69),
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Recipes',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemCount: _yourRecipes.length,
            itemBuilder: (context, index) {
              final recipe = _yourRecipes[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        recipe['image']!,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe['name']!,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/Time.png',
                                      color: const Color(0xFFEC888D),
                                      height: 14,
                                      width: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      recipe['time']!,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFEC888D),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      recipe['rating']!,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFEC888D),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/icons/Star.png',
                                      color: const Color(0xFFEC888D),
                                      height: 14,
                                      width: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopChefs() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Chef',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Color(0xFFFD5D69),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemCount: _topChefs.length,
            itemBuilder: (context, index) {
              final chef = _topChefs[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      chef['image']!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chef['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyAdded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recently Added',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color(0xFFEC888D),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: _recentlyAdded.length,
          itemBuilder: (context, index) {
            var recipe = _recentlyAdded[index];
            return Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 8,
                    right: 8,
                    top: 8,
                    child: Container(
                      height: 150, // Tinggi tetap untuk kontainer deskripsi
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFFD5D69),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _truncateText(recipe['description']!, 25),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/Time.png',
                                      color: const Color(0xFFEC888D),
                                      height: 14,
                                      width: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '30 min',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFEC888D),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      '5',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFFEC888D),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/icons/Star.png',
                                      color: const Color(0xFFEC888D),
                                      height: 14,
                                      width: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      recipe['image']!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavItem(String assetName, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              right: 3,
              left: 3,
            ), // Beri jarak atas untuk icon
            child: Image.asset(
              'assets/icons/$assetName',
              color: isSelected
                  ? Colors.white
                  : Colors.white.withOpacity(
                      0.6), // Warna ikon putih dan transparan saat tidak aktif
              height: 30,
              width: 30,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(
                  bottom: 3), // Beri jarak antara icon dan garis bawah
              height: 2,
              width: 30,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(String assetName) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Color(0xFFFFC6C9),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          assetName,
          color: const Color(0xFFEC888D),
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
