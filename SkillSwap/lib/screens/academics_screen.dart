import 'package:flutter/material.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academics'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Icon and Text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Academic Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Cards for various sections
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildAcademicsCard(
                    context,
                    icon: Icons.book,
                    title: 'Course Details',
                    description: 'View all your enrolled courses and details.',
                    onTap: () {
                      // Navigate to Course Details page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.grade,
                    title: 'Grades',
                    description: 'Check your latest grades and performance.',
                    onTap: () {
                      // Navigate to Grades page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.assignment,
                    title: 'Assignments',
                    description: 'View and submit your assignments.',
                    onTap: () {
                      // Navigate to Assignments page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.calendar_today,
                    title: 'Class Schedule',
                    description: 'See your class schedule for the week.',
                    onTap: () {
                      // Navigate to Class Schedule page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.library_books,
                    title: 'Study Materials',
                    description: 'Access study resources and notes.',
                    onTap: () {
                      // Navigate to Study Materials page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.check_circle_outline,
                    title: 'Attendance',
                    description: 'Track your attendance records.',
                    onTap: () {
                      // Navigate to Attendance page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.library_add_check,
                    title: 'Library Check-In',
                    description: 'Check in and track library activity.',
                    onTap: () {
                      // Navigate to Library Check-In page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.event_note,
                    title: 'Exams & Results',
                    description: 'View exam schedules and results.',
                    onTap: () {
                      // Navigate to Exams & Results page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.notifications,
                    title: 'Academic Alerts',
                    description: 'Stay updated with important notices.',
                    onTap: () {
                      // Navigate to Academic Alerts page
                    },
                  ),
                  _buildAcademicsCard(
                    context,
                    icon: Icons.question_answer,
                    title: 'FAQs & Support',
                    description: 'Get help on academic-related queries.',
                    onTap: () {
                      // Navigate to FAQs & Support page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build individual cards
  Widget _buildAcademicsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blueAccent),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 5),
              Flexible(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}