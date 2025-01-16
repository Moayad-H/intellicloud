import 'package:flutter/material.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/features/homeScreen/widgets/sidebar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold to structure the page
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Profile action
            },
          ),
        ],
      ),
      drawer: SidebarNavigation(activeRoute: AppRoutes.settings),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row for Key Metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetricCard(
                  title: 'Total Energy',
                  value: '150 kWh',
                  icon: Icons.bolt,
                  context: context,
                ),
                _buildMetricCard(
                  title: 'Cost Savings',
                  value: '\$1,200',
                  icon: Icons.monetization_on,
                  context: context,
                ),
                _buildMetricCard(
                  title: 'Completed Tasks',
                  value: '452',
                  icon: Icons.task_alt,
                  context: context,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Placeholder for Charts
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Frozen grey container
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Chart or Content Goes Here',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a metric card
  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required BuildContext context,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850], // Frozen grey background
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
