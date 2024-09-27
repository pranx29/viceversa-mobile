import 'package:flutter/material.dart';
import 'package:viceversa/routes/app_routes.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_3_outlined),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pranavan Sivakumaran',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text('pranx29@example.com',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AccountButton(
              icon: Icons.person,
              label: 'My Profile',
              onPressed: () {
                // Navigate to Customer Profile
              },
            ),
            AccountButton(
              icon: Icons.history,
              label: 'Order History',
              onPressed: () {
                // Navigate to Order History
              },
            ),
            AccountButton(
              icon: Icons.location_on,
              label: 'Shipping Address',
              onPressed: () {
                // Navigate to Shipping Address
              },
            ),
            AccountButton(
              icon: Icons.support_agent,
              label: 'Customer Service',
              onPressed: () {
                // Navigate to Customer Service
              },
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.welcome,
                    (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  AccountButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(label),
        onTap: onPressed,
      ),
    );
  }
}
