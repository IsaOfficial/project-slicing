import 'package:flutter/material.dart';
import 'btm_navbar.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _selectedCommunityCategoryIndex = 0;
  final List<String> _categories = ['Top Recipes', 'Newest', 'Oldest'];
  final List<Map<String, String>> _posts = [
    {
      'username': 'Josh Ryan',
      'time': '2 days ago',
      'profileImage': 'assets/images/Andrew.jpg',
      'postImage': 'assets/images/Spicy Pasta.jpg',
      'title': 'Delicious Pasta',
      'description': 'A simple and quick pasta recipe.',
      'rating': '4.5',
      'cookingTime': '30 mins',
      'comments': '10'
    },
    {
      'username': 'Dakota Mullen',
      'time': '5 days ago',
      'profileImage': 'assets/images/Emily.jpg',
      'postImage': 'assets/images/Pancakes.jpg',
      'title': 'Pancake',
      'description': 'A delicious cake recipe.',
      'rating': '5.0',
      'cookingTime': '1 hour',
      'comments': '20'
    },
    {
      'username': 'Cia Food',
      'time': '1 week ago',
      'profileImage': 'assets/images/Jessica.jpg',
      'postImage': 'assets/images/Healthy Salad.jpeg',
      'title': 'Healthy Salad',
      'description': 'A healthy and easy salad recipe.',
      'rating': '4.0',
      'cookingTime': '15 mins',
      'comments': '5'
    },
  ];

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

  Widget _buildCommunityCategoryList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCommunityCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCommunityCategoryIndex = index;
              });
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

  Widget _buildPost(Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(post['profileImage']!),
          ),
          title: Text(post['username']!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(post['time']!),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(16), // Adjust the margin as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(post['postImage']!),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFFD5D69),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post['title']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    const SizedBox(height: 5),
                    Text(post['description']!,
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.white, size: 16),
                            const SizedBox(width: 5),
                            Text(post['rating']!,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.timer,
                                color: Colors.white, size: 16),
                            const SizedBox(width: 5),
                            Text(post['cookingTime']!,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.comment,
                                color: Colors.white, size: 16),
                            const SizedBox(width: 5),
                            Text(post['comments']!,
                                style: const TextStyle(color: Colors.white))
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
        const Divider(),
      ],
    );
  }

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
        title:
            const Text('Community', style: TextStyle(color: Color(0xFFFD5D69))),
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: _buildCommunityCategoryList(),
        ),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return _buildPost(_posts[index]);
        },
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
