import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Colors.deepOrange, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.notification_important, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'University Alerts',
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

            // Alerts List Section
            const Text(
              'Latest Alerts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildAlertTile(
                    icon: Icons.event,
                    title: 'Event Postponed',
                    description: 'The seminar scheduled for tomorrow has been postponed.',
                    color: Colors.blueAccent,
                  ),
                  _buildAlertTile(
                    icon: Icons.warning,
                    title: 'Weather Alert',
                    description: 'Heavy rainfall expected tomorrow. Stay safe.',
                    color: Colors.redAccent,
                  ),
                  _buildAlertTile(
                    icon: Icons.schedule,
                    title: 'Class Reschedule',
                    description: 'Physics class will be held at 10 AM instead of 2 PM.',
                    color: Colors.green,
                  ),
                  _buildAlertTile(
                    icon: Icons.announcement,
                    title: 'Holiday Notice',
                    description: 'University closed on Friday for Diwali celebrations.',
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // View All Alerts Button
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                label: const Text(
                  'View All Alerts',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  // Action to view all alerts
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build an alert tile
  Widget _buildAlertTile({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}