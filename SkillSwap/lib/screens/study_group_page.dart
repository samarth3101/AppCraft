import 'package:flutter/material.dart';
import 'chat_page.dart'; // Import the ChatPage here

class StudyGroupPage extends StatelessWidget {
  // Sample data for study groups
  final List<Map<String, dynamic>> studyGroups = [
    {
      'name': 'AI Study Group',
      'description': 'Discuss advancements in AI, share resources, and collaborate on projects.',
      'members': 920,
      'lastUpdate': 'New article on AI ethics!',
    },
    {
      'name': 'Machine Learning Enthusiasts',
      'description': 'For all ML lovers! Share tips, project ideas, and code.',
      'members': 685,
      'lastUpdate': 'Weekly meeting on supervised learning - Join now!',
    },
    {
      'name': 'Data Science Club',
      'description': 'Explore data science tools and techniques, including hands-on workshops.',
      'members': 315,
      'lastUpdate': 'Latest Kaggle competition details shared.',
    },
    {
      'name': 'University Updates',
      'description': 'Get all updates here!',
      'members': 1500,
      'lastUpdate': 'Exam Form released.',
    },
  ];

  StudyGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Study Groups',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Join groups to learn, share, and collaborate with peers.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: studyGroups.length,
                itemBuilder: (context, index) {
                  final group = studyGroups[index];
                  return Card(
                    color: Colors.blue[50],
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            group['name'] as String,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            group['description'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Members: ${group['members']}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Last Update: ${group['lastUpdate']}',
                            style: TextStyle(
                              color: Colors.green[600],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to the ChatPage when the button is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                      groupName: group['name'] as String,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                              ),
                              child: const Text(
                                'Join Group',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}