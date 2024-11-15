import 'package:flutter/material.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transport'),
        backgroundColor: Colors.teal,
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
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.directions_bus, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Transport Information',
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

            // Bus Schedule Cards Section
            const Text(
              'Bus Schedules',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildBusScheduleCard(
                    route: 'Route 1: Pimpri to PCU Campus',
                    departureTimes: '7:30 AM, 8:20 AM, 5:00 PM',
                  ),
                  _buildBusScheduleCard(
                    route: 'Route 2: Chikhali to PCU Campus',
                    departureTimes: '8:00 AM, 12:00 PM, 6:00 PM',
                  ),
                  _buildBusScheduleCard(
                    route: 'Route 3: PCCoE to PCU Campus',
                    departureTimes: '8:30 AM, 1:00 PM, 7:00 PM',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Contact Section
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.teal,
                ),
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text(
                  'Contact Transport Support',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  // Action for contacting support
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build individual bus schedule cards
  Widget _buildBusScheduleCard({
    required String route,
    required String departureTimes,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              route,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Departure: $departureTimes',
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}