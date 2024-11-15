import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
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
                  Icon(Icons.account_balance_wallet, size: 40, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Account Overview',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Cards for various account-related sections
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildAccountCard(
                    context,
                    icon: Icons.payment,
                    title: 'Manage Fees',
                    description: 'View and pay your outstanding fees.',
                    onTap: () {
                      // Navigate to Manage Fees page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.receipt_long,
                    title: 'Bill Payments',
                    description: 'Pay your bills directly from here.',
                    onTap: () {
                      // Navigate to Bill Payments page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.history,
                    title: 'Transaction History',
                    description: 'View all your past transactions.',
                    onTap: () {
                      // Navigate to Transaction History page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.settings,
                    title: 'Account Settings',
                    description: 'Manage your account preferences.',
                    onTap: () {
                      // Navigate to Account Settings page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.account_balance,
                    title: 'View Balance',
                    description: 'Check your current account balance.',
                    onTap: () {
                      // Navigate to View Balance page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.school,
                    title: 'Scholarships',
                    description: 'Explore available scholarships.',
                    onTap: () {
                      // Navigate to Scholarships page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.library_books,
                    title: 'Fee History',
                    description: 'Access your complete fee payment history.',
                    onTap: () {
                      // Navigate to Fee History page
                    },
                  ),
                  _buildAccountCard(
                    context,
                    icon: Icons.attach_money,
                    title: 'Loan Application',
                    description: 'Apply for student loans and track status.',
                    onTap: () {
                      // Navigate to Loan Application page
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
  Widget _buildAccountCard(
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
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 5),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}