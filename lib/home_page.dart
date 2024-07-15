import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMainCategoryIndex = 0;
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
                _buildCircleIcon('assets/icons/Notification.png'),
                const SizedBox(width: 10),
                _buildCircleIcon('assets/icons/Search.png'),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIcon(String assetName) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
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

  Widget _buildCategoryList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedMainCategoryIndex ==
              index; // Set the condition to check if category is selected
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedMainCategoryIndex = index;
              }); // Handle category selection
            },
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

  Widget _buildYourRecipes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Recipes',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _yourRecipes.length,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(_yourRecipes[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                _yourRecipes[index]['name']!,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/Time.png',
                                  color: Colors.white,
                                  height: 14,
                                  width: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  _yourRecipes[index]['time']!,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              _yourRecipes[index]['rating']!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopChefs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Chefs',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _topChefs.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_topChefs[index]['image']!),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _topChefs[index]['name']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyAdded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _recentlyAdded.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(_recentlyAdded[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _recentlyAdded[index]['name']!,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _recentlyAdded[index]['description']!,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Color(0xFFEC888D),
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              _recentlyAdded[index]['time']!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color(0xFFEC888D),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              _recentlyAdded[index]['rating']!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return text.substring(0, maxLength) + '...';
    } else {
      return text;
    }
  }
}
