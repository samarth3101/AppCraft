import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'SkillSwap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              // Navigate to Dashboard screen
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Navigate to Profile screen
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              // Log out action
            },
          ),
        ],
      ),
    );
  }
}