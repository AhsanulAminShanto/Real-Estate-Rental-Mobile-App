// lib/presentation/pages/menu_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../controllers/home_controller.dart';

class MenuPage extends StatelessWidget {
  final HomeController controller = Get.find();

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120), // Increased from 70 to 120 for more spacing
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(Icons.home, 'Home', '/home'),
                  _buildMenuItem(Icons.person, 'Profile', '/profile'),
                  _buildMenuItem(Icons.location_on, 'Nearby', '/nearby'),
                  Divider(color: Colors.white, thickness: 2, height: 1),
                  _buildMenuItem(Icons.bookmark, 'Bookmark', '/bookmark'),
                  _buildMenuItem(Icons.notifications, 'Notification', '/notification'),
                  _buildMenuItem(Icons.message, 'Message', '/message'),
                  Divider(color: Colors.white, thickness: 2, height: 1),
                  _buildMenuItem(Icons.settings, 'Setting', '/setting'),
                  _buildMenuItem(Icons.help, 'Help', '/help'),
                  _buildMenuItem(Icons.logout, 'Logout', '/login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () {
        if (route == '/login') {
          Get.offAllNamed(route); // Clears all previous routes and goes to login
        } else {
          Get.toNamed(route); // Pushes the new route
        }
        Get.back(); // Closes the drawer
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            SizedBox(width: 8), // Spacing between icon and text
            Expanded( // Ensures text doesn't overflow
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
                overflow: TextOverflow.ellipsis, // Handles long text
              ),
            ),
          ],
        ),
      ),
    );
  }
}