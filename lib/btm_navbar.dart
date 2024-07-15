import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget _buildNavItem(String assetName, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
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
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 1),
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
        ),
      ),
    );
  }
}
