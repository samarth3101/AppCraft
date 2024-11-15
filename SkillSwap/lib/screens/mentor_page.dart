import 'package:flutter/material.dart';

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Text(
                'Mentorship Hub',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Top 3 Mentors
            const Text(
              'Top 3 Mentors in University',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),

            // Top 3 Mentor Cards
            Expanded(
              child: ListView(
                children: [
                  _buildRankedMentorCard(
                    rank: 1,
                    name: 'Samarth Patil',
                    specialty: 'AI/ML Specialist | Web Developer',
                    imagePath: 'assets/sam.png',
                  ),
                  _buildRankedMentorCard(
                    rank: 2,
                    name: 'Soham Supekar',
                    specialty: 'Mobile Dev Expert | Java & Dart',
                    imagePath: 'assets/stan.png',
                  ),
                  _buildRankedMentorCard(
                    rank: 3,
                    name: 'Atharv Patki',
                    specialty: 'Python Developer | GUI & Database',
                    imagePath: 'assets/danish.png',
                  ),
                  const SizedBox(height: 20),

                  // Section for other available mentors
                  const Text(
                    'Available Mentors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Other mentor cards
                  _buildMentorCard(
                    name: 'Dr. Sagar Pandey',
                    specialty: 'Data Science Enthusiast | AIDS',
                    imagePath: 'assets/boyimg.png',
                  ),
                  _buildMentorCard(
                    name: 'Ankush Dahat',
                    specialty: 'Python | Database',
                    imagePath: 'assets/boyimg.png',
                  ),
                  _buildMentorCard(
                    name: 'Dr. Neeru Malik',
                    specialty: 'Digital Logics and Microprocessor | BxE',
                    imagePath: 'assets/ladyimg.jpeg',
                  ),
                  _buildMentorCard(
                    name: 'Swati Shirke Deshmukh',
                    specialty: 'C++ | Data Structure & Algorithms',
                    imagePath: 'assets/ladyimg.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card for Top Ranked Mentors
  Widget _buildRankedMentorCard({
    required int rank,
    required String name,
    required String specialty,
    required String imagePath,
  }) {
    return Card(
      color: rank == 1
          ? Colors.amber[100]
          : rank == 2
              ? Colors.blue[50]
              : Colors.green[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(specialty),
        trailing: Text(
          '#$rank',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: rank == 1
                ? Colors.amber
                : rank == 2
                    ? Colors.blue
                    : Colors.green,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  // Card for Other Mentors
  Widget _buildMentorCard({
    required String name,
    required String specialty,
    required String imagePath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(specialty),
        trailing: ElevatedButton(
          onPressed: () {
            // Action for scheduling/contacting
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Contact',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
