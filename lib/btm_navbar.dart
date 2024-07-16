import 'package:flutter/material.dart';
import 'home_page.dart';
import 'community_page.dart';
import 'categories_page.dart';
import 'profile_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  Widget _buildNavItem(String assetName, int index, BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CommunityPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CategoriesPage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              right: 3,
              left: 3,
            ),
            child: Image.asset(
              'assets/icons/$assetName',
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
              height: 30,
              width: 30,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              height: 2,
              width: 30,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 1),
        decoration: BoxDecoration(
          color: const Color(0xFFFD5D69),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem('Home.png', 0, context),
            _buildNavItem('Community.png', 1, context),
            _buildNavItem('Categories.png', 2, context),
            _buildNavItem('Profile.png', 3, context),
          ],
        ),
      ),
    );
  }
}
