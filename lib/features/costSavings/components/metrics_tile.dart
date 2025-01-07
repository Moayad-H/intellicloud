//  Helper function to build a metric card
import 'package:flutter/material.dart';

Widget buildMetricCard({
  required String title,
  required String value,
  required IconData icon,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[850], // Frozen grey background
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
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
  );
}
