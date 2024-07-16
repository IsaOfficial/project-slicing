import 'package:flutter/material.dart';
import 'btm_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Profile Page')),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3),
    );
  }
}
