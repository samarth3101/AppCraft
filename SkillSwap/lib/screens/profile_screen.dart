import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profileimg.png'), // Add a profile image here
            ),
            const SizedBox(height: 20),
            const Text(
              'Samarth Patil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: samarth.patil3101@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'About: Enthusiastic learner and mentor. Focused on Computer Science with AI & ML specialization.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Academic Information Section
            const Text(
              'Academic Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Degree: B.Tech in Computer Science'),
            const Text('Specialization: AI and Machine Learning'),
            const Text('Current Year: 3rd Year'),
            const SizedBox(height: 20),

            // Achievements Section
            const Text(
              'Achievements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('- Top 10 in Ideathon Hackathon'),
            const Text('- 1st Place in Poster-Making Competition'),
            const SizedBox(height: 20),

            // Button Section
            ElevatedButton(
              onPressed: () {
                // Action to edit profile or logout
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}