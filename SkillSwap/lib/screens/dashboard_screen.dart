import 'package:flutter/material.dart';

// Import the screens
import 'academics_screen.dart';
import 'accounts_screen.dart';
import 'feedback_screen.dart';
import 'transport_screen.dart';
import 'alerts_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon,
      String description, Widget nextScreen) {
    return GestureDetector(
      onTap: () {
        // Navigate to the appropriate screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blueAccent),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(context, "Academics", Icons.school,
                "View courses and grades", const AcademicsScreen()),
            _buildDashboardCard(context, "Accounts", Icons.account_balance,
                "Manage fees and bills", const AccountsScreen()),
            _buildDashboardCard(context, "Feedback", Icons.feedback,
                "Provide course feedback", const FeedbackScreen()),
            _buildDashboardCard(context, "Transport", Icons.directions_bus,
                "Check bus schedules", const TransportScreen()),
            _buildDashboardCard(context, "Alerts", Icons.notifications,
                "University alerts", const AlertsScreen()),
            // Add more cards for Events, Library, Cafeteria, etc.
          ],
        ),
      ),
    );
  }
}
